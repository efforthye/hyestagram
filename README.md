# hyestagram
- https://www.inflearn.com/course/lecture?courseSlug=flutter-sns%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B0&unitId=188852&tab=curriculum
- 

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
### 프로젝트에 파이어베이스 연결
- node.js & git install -> 파이어베이스 사이트 접근 -> 프로젝트 선택 -> 플러터 아이콘 클릭
- firebase cli 설치 및 로그인 : `npm install -g firebase-tools` -> `firebase login` -> `firebase projects:list`
- flutterFire cli 설치 및 실행 : `dart pub global activate flutterfire_cli` -> `flutterfire configure --project=hyestagram-flutter`
  - flutterfire 명령어를 찾지 못하면 환경변수에 /.pub-cache/bin 경로를 추가해 준다.
    - mac : `export PATH="$PATH":"$HOME/.pub-cache/bin"` 
    - windows : `C:\Users\effor\AppData\Local\Pub\Cache\bin`
      - `effor` : username
  - 추가 했으면 터미널 다시 열고 `flutterfire --version`으로 확인해보고 명령어를 재실행하면 된다.
  - 그래도 안되면 컴퓨터 껐다 켜거나 다른 터미널 열어서 해보면 된다.
  - 그래도 정말 안되면 `flutterfire.bat configure --project=hyestagram-flutter` 으로 실행하면 된다.
  - 이후 세팅이 완료되면 lib 내부에 firebase_options.dart가 생성된다.
- 파이어베이스 기본 설정
  - `firebase init` -> y -> 파이어스토어,스토리지 스페이스바로 체크 -> 엔터
  - 파이어베이스에 프로젝트를 이미 생성하였기 때문에 'use an existing project' -> 엔터
  - 생성한 프로젝트인 'hyestagram-flutter' 선택 -> 엔터 -> (기본 파일명) -> 엔터/엔터/엔터 -> 완료
  - 이후 세팅이 완료되면 root에 .firebaserc, firebase.json, firestore.indexs.json, firestore.rules, storage.ruls 파일이 생성된다.
### 파이어베이스 관련 패키지 설치
- `flutter pub add firebase_core firebase_auth firebase_storage cloud_firestore`
  - firebase_core
  - firebase_auth
  - firebase_storage
  - cloud_firestore
- `flutter pub get`
### main 함수에 파이어베이스 기본 설정 추가
```
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // async 사용
  await Firebase.initializeApp( // 파이어베이스 초기화
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
```
### 안드로이드 설정 추가
- root/android/app/build.gradle 접근 -> `defaultConfig` 검색 -> 내부의 `minSdkVersion`을 `flutter.minSdkVersion` 에서 `19`로 변경
  ```
  defaultConfig{
    ...
    minSdkVersion 19
  }
  ```
- root/android/build.gradle 접근 -> `ext.kotlin_version` 검색 -> 아래 사이트에서 코틀린 최신 버전 확인 -> 최신 버전으로 세팅
  - 버전 확인 : https://kotlinlang.org/docs/releases.html#release-details
  ```
    ext.kotlin_version = '1.9.20' // 기존 '1.7.10' -> '1.9.20' 변경
  ```
- root/android 접근 -> `.gradle` 폴더 삭제
- 이후 project를 실행하여 보고, 별다른 오류가 없으면 설정이 잘 된 것이다.
