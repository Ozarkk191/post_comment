part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitialState extends PostState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PostState {
  final List<PostWithCommentModel> data;

  LoadedState({@required this.data});

  @override
  List<Object> get props => null;
}

class ErrorState extends PostState {
  final String errorText;
  ErrorState({@required this.errorText});
  @override
  List<Object> get props => null;
}

class TitleErrorState extends PostState {
  final String errorText;
  TitleErrorState({@required this.errorText});
  @override
  List<Object> get props => null;
}

class BodyErrorState extends PostState {
  final String errorText;
  BodyErrorState({@required this.errorText});
  @override
  List<Object> get props => null;
}
