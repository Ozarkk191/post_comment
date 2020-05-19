import 'package:test_get_post/models/post_with_comment_model.dart';
import 'package:test_get_post/service/haircut_service_client.dart';

class CommentRepository {
  final _client = HaircutServiceClient();

  Future<List<PostWithCommentModel>> fetchCommentList() async {
    final response = await _client.get('posts', withAccessToken: false);
    final commentResponse =
        await _client.get('comments', withAccessToken: false);
    commentResponse.map<PostWithCommentModel>((post) {
      print(post);
    }).toList(growable: false);

    return response
        .map<PostWithCommentModel>(
            (post) => PostWithCommentModel.fromJson(post))
        .toList(growable: false);
  }

  Future createComment(CreateCommetParameters parameters) async {
    // print(_client.post('posts', data: parameters, withAccessToken: false));
    return await _client.post('comments',
        data: parameters, withAccessToken: false);
  }

  Future deleteComment(int id) async {
    return await _client.delete('comments/$id', withAccessToken: false);
  }
}
