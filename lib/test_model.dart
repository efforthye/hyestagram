// model이라는 클래스는 데이터를 저장하는 역할을 할 것이다.
// 아래의 메서드들은 매번 타이핑을 하는 게 아니라, 안드로이드 스튜디오의
// 플러그인을 사용하여 편하게 작성할 수 있다.
// 해당 플러그인은 좌측 상단의 file -> settings -> plugins 에서
// dart라고 검색하면 dart data class 라는 플러그인을 install 해주고 ok를 누른다.
// 이후 기존에 있던 3개의 함수를 지우고 단축키인 'alt' + 'insert' 키를 누르면
// Generate 팝업이 뜨며 toMap() and fromMap() 을 선택하고 ok를 누르면 생성된다.
// 또 'alt' + 'insert' 누르고 'copy'를 선택하면 3개의 함수를 모두 생성할 수 있게된다.
// 하지만 프로젝트가 커지면 다른 방법의 json 직렬화를 해주어야 한다. (노션에 정리해 두었다.)

class TestModel {
  final String test1;
  final String test2;

  const TestModel({
    required this.test1,
    required this.test2
  });

  // toMap
  Map<String, dynamic> toMap(){
    return {
      'test1' : this.test1,
      'test2' : this.test2,
    };
  }

  // fromMap
  factory TestModel.fromMap(Map<String, dynamic> map){
    return TestModel(
      test1: map['test1'] as String,
      test2: map['test2'] as String,
    );
  }

  // copyWith
  TestModel copyWith({
    String? test1,
    String? test2,
  }){
    return TestModel(
      test1: test1 ?? this.test1,
      test2: test2 ?? this.test2
    );
  }
}