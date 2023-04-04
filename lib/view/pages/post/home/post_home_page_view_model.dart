
import 'package:flutter_http_riverpot_app/model/post/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// * 창고 관리자 (Provider) *
// homePageViewModel 프로바이더는 HomePageViewModel();를 관리함
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel,PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null); // 처음에 창고의 데이터를 초기화 해줘야 함
  // 상황에 따라서 다르게 안넣기 위해서  HomePageModel({this.posts}); required를 넣지 않고 ?로 null을 허용해서 처리
  
});


// * 창고 (Store) *
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts; // 절대 null이 안되기 때문에 !를 붙여서 사용
    List<Post> newPosts = [...posts, post]; // 추가, 삭제, 수정, 검색 ...post가 스트림으로 다운캐스팅 정리연산자 사용. 왜 정리연산자를 사용하나?
    state = PostHomePageModel(posts: newPosts); // 래퍼런스가 달라지면 된다 (값이 동일해도 다시 그린다 -> 사기쳐도 다시 그림) 이런 부분은 코드로 제어 하면 됨
  }

  void remove(int id){
    List<Post> posts = state!.posts;
    // 검색과 삭제
    // List<Post> newPosts = posts.where((e) => e.id == id).toList(); // 검색

    List<Post> newPosts = posts.where((e) => e.id != id).toList(); // 삭제
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post){
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList(); // 기존 id와 update된 후의 id 랑 같으면 배열에 넣고 아니면 기존값 리턴
    state = PostHomePageModel(posts: newPosts);
  }
}

// * 창고 데이터 *
// 홈페이지에 필요한 데이터 모델. 나중에 dto에서 받아서 그대로 매핑하면 됨
class PostHomePageModel {
  List<Post> posts; // homePagePostDto 이런식으로 적지말고 posts 처럼 간결하게 적어야 view 에서 머리 안아픔
  PostHomePageModel({required this.posts});

}

