import 'package:flutter_http_riverpot_app/model/user/user.dart';

class Post{
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  Post({this.userId, this.id, this.title, this.body, this.user});

  //Json을 object로 바꾸어줌
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body'],
      user: User.fromJson(json["user"]) // 연결돼서 json으로 직렬화되어 들어감
    );
  }

  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body,
      'user' : user?.toJson() // user?.toJson() 처럼 ?붙은애가 null일 될 수도 있을 때 null이 들고있는 메서드를 처리할때 null이면 호출안하고 null아니면 호출 함
    };
  }
}