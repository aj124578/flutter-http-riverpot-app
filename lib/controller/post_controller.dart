

import 'package:flutter_http_riverpot_app/model/post/post.dart';
import 'package:flutter_http_riverpot_app/model/post/post_repository.dart';
import 'package:flutter_http_riverpot_app/view/pages/post/home/post_home_page_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final postController = Provider<PostController>((ref) {
  return PostController(ref);
});


class PostController{

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    // ref.read(homePageViewModel.notifier).state = HomePageModel(posts: homePagePostDto);
    ref.read(postHomePageProvider.notifier).init(postDtoList);
  }

  Future<void> addPost(String title) async {
    Post post = await PostRepository().save(title);
    ref.read(postHomePageProvider.notifier).add(post); // .state해서 넣으면 재활용이 안되니까 함수를 만들어서 호출해서 사용
  }

  Future<void> removePost(int id) async {
    await PostRepository().deleteById(id);
    ref.read(postHomePageProvider.notifier).remove(id);
  }

  Future<void> updatePost(Post post) async {
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(postPS);
  }
}