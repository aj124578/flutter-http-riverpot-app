
import 'package:flutter_riverpod/flutter_riverpod.dart';


// * 창고 관리자 (Provider) *
// homePageViewModel 프로바이더는 HomePageViewModel();를 관리함
final homePageViewModel = StateNotifierProvider<HomePageViewModel,HomePageModel>((ref) {
  return HomePageViewModel();
});


// * 창고 데이터 *
// 홈페이지에 필요한 데이터 모델. 나중에 dto에서 받아서 그대로 매핑하면 됨
class HomePageModel {
  // int와 String 타입의 List를 들고 있어야 됨
  // int id;
  // String title;

  List<dynamic> posts = [];

}

// * 창고 (Store) *
class HomePageViewModel extends StateNotifier<HomePageModel>{
  HomePageViewModel(super.state);

}
