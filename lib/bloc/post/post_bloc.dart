import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:test_get_post/models/post_with_comment_model.dart';
import 'package:test_get_post/repositories/post_repository.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({@required this.repository});

  @override
  PostState get initialState => PostInitialState();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield LoadingState();
      try {
        List<PostWithCommentModel> jsonModel =
            await repository.fetchMyPostList();
        yield LoadedState(data: jsonModel);
      } catch (e) {
        yield ErrorState(errorText: e.toString());
      }
    }

    if (event is TitleErrorEvent) {
      if (event.value.length == 0) {
        yield TitleErrorState(errorText: 'This field is not empty');
      }
    }
    if (event is BodyErrorEvent) {
      if (event.value.length == 0) {
        yield TitleErrorState(errorText: 'This field is not empty');
      }
    }
  }
}
