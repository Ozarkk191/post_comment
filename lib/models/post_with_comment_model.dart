import 'package:test_get_post/models/request_body_parameters.dart';

class PostWithCommentModel {
  int userId;
  int id;
  String title;
  String body;
  List<Comments> comments;

  PostWithCommentModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.comments,
  });

  PostWithCommentModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    comments = json['comments'];
  }
}

class Comments {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comments({this.postId, this.id, this.name, this.email, this.body});

  Comments.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}

class CreateCommetParameters extends RequestBodyParameters {
  int postId;
  String name;
  String email;
  String body;

  CreateCommetParameters(this.postId, this.name, this.email, this.body);

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };
}
