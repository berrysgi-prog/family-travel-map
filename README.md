# 우리 가족 나들이 지도 (가족 공유판)

## 파일
- index.html: 앱 전체 (지도 데이터 포함)
- config.js: Supabase 주소·키, 가족 이름과 계정 이메일 ← 이 파일만 내 정보로 고쳐요
- supabase-setup.sql: Supabase SQL Editor에 한 번 붙여 넣는 설정
- manifest.json, 아이콘 3개: 홈 화면 설치용

## 순서
1. Supabase에서 프로젝트 만들기 (지역: Northeast Asia (Seoul))
2. SQL Editor에 supabase-setup.sql 내용을 붙여 넣고 Run
3. Authentication에서 새 가입 막기(Allow new users to sign up 끄기)
4. Authentication → Users → Add user로 가족 계정 만들기 (Auto Confirm 체크)
5. API Keys 화면의 Project URL과 publishable(또는 anon public) 키를 config.js에 넣기
6. GitHub 저장소에 index.html, config.js 올리기
7. 휴대폰에서 열고 이름 고르고 가족 비밀번호로 들어가기

## 알아 둘 것
- config.js의 키는 공개돼도 괜찮은 키예요. secret / service_role 키는 절대 넣지 마세요.
- 새 가입을 막아 두었기 때문에, 직접 만든 가족 계정만 들어올 수 있어요.
- 무료 요금제는 7일 동안 아무도 열지 않으면 프로젝트가 잠시 멈춰요. 메일이 오면 대시보드에서 Restore를 누르면 돼요.
- 무료 사진 공간은 1GB예요. 사진 1장이 약 0.3MB라 3,000장쯤 들어가요.
