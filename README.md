# hyestagram

## 기기 세팅
### 가상 기기 세팅
1. 가상 기기 xml 다운로드
2. create device -> s20 -> tiramisu -> 33
3. no skin -> finish
### 화면 세팅
1. device manager -> hide
2. running device -> right mouse -> view mode -> window

## 클래스 세팅
1. dart data class 플러그인 설치
2. 기본 형태의 클래스 작성
```
class TestModel {
  final String test1;
  final String test2;

  const TestModel({
    required this.test1,
    required this.test2
  });
}
```
3. 'alt'+'insert' -> toMap() and fromMap() -> ok
4. 'alt'+'insert' -> copy -> ok

## 파이어베이스 세팅
1. 파이어베이스 사이트 접근 -> 시작하기 -> 프로젝트 만들기
  - https://firebase.google.com/?hl=ko
2. 프로젝트 이름(hyestagram-flutter) 입력 -> 애널리틱스 미사용 -> create -> wait
3. 기능 활성화
  - Authentication : 회원가입 기능을 위한 사용자 인증 및 관리 어센티케이션
    - 시작하기 -> 이메일/비밀번호 -> 이메일/비밀번호 사용설정 on -> 저장
  - Cloud Firestore : 데이터베이스 기능 이용을 위한 클라우드 파이어스토어
    - 좌측 모든 제품 -> Cloud Firestore -> 데이터베이스 만들기
    - 테스트 모드에서 시작 -> 다음 -> 위치 선택(asia-northeast3 seoul) -> 사용 설정
  - Storage : 이미지 저장 기능을 위한 스토리지
    - Storage -> 시작하기 -> 테스트 모드에서 시작 -> 다음 -> (기본위치선택됨) -> 완료
4. 서비스 rule 설정
  - Cloud Firestore : 규칙 -> `allow read, write: if request.time < timestamp.date(2023, 12, 16);` -> `allow read, write: if request.auth != null;` -> 게시
    - 기존 규칙 : 12월 16일 전까지는 누구나 읽기, 쓰기 허용 -> 새로운 규칙 : 인증을 받은 유저의 경우 읽기, 쓰기 허용
  - Storage : 스토리지도 Cloud Firestore와 마찬가지로 인증된 유저만 읽기, 쓰기 가능하도록 설정

## 프로젝트와 파이어베이스 연동
