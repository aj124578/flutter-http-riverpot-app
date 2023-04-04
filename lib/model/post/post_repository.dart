


import 'package:flutter_http_riverpot_app/model/post/post.dart';

class PostRepository {
  static PostRepository _instance =
      PostRepository._single(); // 이름이 있는 생성자를 호출해주어야 함

  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), (){
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  Future<Post> save(String title) {
    return Future.delayed(Duration(seconds: 1), (){
      return Post(id: 4, title: "제목4");
      // save 하면 db에 들어간 데이터를 영속화해서 주어야 함
      // rest 는 delete를 제외한 모든 데이터를 다 돌려주어야 함
    });
  }

  Future<void> deleteById(int id) {
    return Future.delayed(Duration(seconds: 1));
  }

  Future<Post> update(Post post) {
    return Future.delayed(Duration(seconds: 1), (){
      return post;
    });
  }
}
