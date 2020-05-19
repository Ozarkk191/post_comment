import 'package:test_get_post/models/post_model.dart';
import 'package:test_get_post/models/post_with_comment_model.dart';
import 'package:test_get_post/service/haircut_service_client.dart';

class PostRepository {
  final _client = HaircutServiceClient();

  Future<List<PostWithCommentModel>> fetchMyPostList() async {
    final response = await _client.get('posts', withAccessToken: false);
    final commentsResponse =
        await _client.get('comments', withAccessToken: false);

    List<PostWithCommentModel> _postWithComment =
        new List<PostWithCommentModel>();
    // List<Comments> _commentList = new List<Comments>();

    response.forEach((posts) {
      var post = Posts.fromJson(posts);
      // print(post.toJson());
      List<Comments> _commentList = new List<Comments>();

      commentsResponse.forEach((comments) {
        // _commentList.clear();
        var comment = Comments.fromJson(comments);

        if (comment.postId == post.id) {
          // var commentData = Comments(
          //   id: comment.id,
          //   postId: comment.postId,
          //   name: comment.name,
          //   email: comment.email,
          //   body: comment.body,
          // );
          _commentList.add(comment);
        }
      });
      var pwc = PostWithCommentModel(
        id: post.id,
        body: post.body,
        title: post.title,
        userId: post.userId,
        comments: _commentList,
      );
      _postWithComment.add(pwc);
    });

    // response.map<PostWithCommentModel>(
    //   (posts) {
    //     var post = Posts.fromJson(posts);

    //     commentResponse.map<Comments>(
    //       (comment) {
    //         var com = Comments.fromJson(comment);

    //         if (com.postId == post.id) {
    // var commentData = Comments(
    //   id: com.id,
    //   postId: com.postId,
    //   name: com.name,
    //   email: com.email,
    //   body: com.body,
    // );
    //           _commentList.add(commentData);

    //         }
    // var pwc = PostWithCommentModel(
    //     id: post.id,
    //     body: post.body,
    //     title: post.title,
    //     userId: post.userId,
    //     comments: _commentList,
    //   );

    //   _postWithComment.add(pwc);
    //   _commentList.clear();
    //       },
    //     ).toList(growable: false);
    //   },
    // ).toList(growable: false);
    return _postWithComment;
  }

  Future createMyPlace(CreatePostParameters parameters) async {
    // print(_client.post('posts', data: parameters, withAccessToken: false));
    return await _client.post('posts',
        data: parameters, withAccessToken: false);
  }

  Future updateMyPlace(int id, UpdatePostParameters parameters) async {
    return await _client.put('posts/$id',
        data: parameters, withAccessToken: false);
  }

  Future deleteMyPlace(int id) async {
    return await _client.delete('posts/$id', withAccessToken: false);
  }
}
