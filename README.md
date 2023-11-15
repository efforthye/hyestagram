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