// 우리 가족 나들이 지도 설정 파일
// 1) Supabase 대시보드 → Project Settings → API Keys 에서 두 값을 복사해 아래 따옴표 안에 붙여 넣어요.
// 2) members 는 Supabase에서 만든 가족 계정과 똑같이 맞춰요. (name: 화면에 보일 이름, email: 계정 이메일)

window.FAMILY_CONFIG = {
  supabaseUrl: 'https://skwxolkwtlsxrgiwasmn.supabase.co',
  supabaseKey: 'sb_publishable_aPLmHnWn-i3tG5A5Ih-NUA_WUHd92vh',

  members: [
    { name: '엄마', email: 'mom@ourfamily.map' },
    { name: '아빠', email: 'dad@ourfamily.map' },
    { name: '첫째', email: 'first@ourfamily.map' },
    { name: '둘째', email: 'second@ourfamily.map' }
  ]
};
