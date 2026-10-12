-- 우리 가족 나들이 지도: Supabase SQL Editor에 통째로 붙여 넣고 Run 을 누르세요. (한 번만)

-- 1) 장소
create table if not exists public.places (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text not null default '관광지',
  dong text not null,
  dong_name text, gk text, gname text,
  sido text, sido_name text, sido_short text,
  lon double precision, lat double precision,
  created_at timestamptz not null default now(),
  created_by uuid default auth.uid()
);

-- 2) 다녀온 기록
create table if not exists public.visits (
  id uuid primary key default gen_random_uuid(),
  place_id uuid not null references public.places(id) on delete cascade,
  date date not null,
  memo text default '',
  photos text[] not null default '{}',
  created_by_name text,
  created_at timestamptz not null default now(),
  created_by uuid default auth.uid()
);

-- 3) 가족(로그인한 사람)만 읽고 쓸 수 있게
alter table public.places enable row level security;
alter table public.visits enable row level security;
drop policy if exists "family places" on public.places;
drop policy if exists "family visits" on public.visits;
create policy "family places" on public.places for all to authenticated using (true) with check (true);
create policy "family visits" on public.visits for all to authenticated using (true) with check (true);
grant select, insert, update, delete on public.places, public.visits to authenticated;

-- 4) 사진 보관함 (비공개)
insert into storage.buckets (id, name, public) values ('photos', 'photos', false)
on conflict (id) do nothing;
drop policy if exists "family photos read" on storage.objects;
drop policy if exists "family photos add" on storage.objects;
drop policy if exists "family photos change" on storage.objects;
drop policy if exists "family photos delete" on storage.objects;
create policy "family photos read" on storage.objects for select to authenticated using (bucket_id = 'photos');
create policy "family photos add" on storage.objects for insert to authenticated with check (bucket_id = 'photos');
create policy "family photos change" on storage.objects for update to authenticated using (bucket_id = 'photos') with check (bucket_id = 'photos');
create policy "family photos delete" on storage.objects for delete to authenticated using (bucket_id = 'photos');
