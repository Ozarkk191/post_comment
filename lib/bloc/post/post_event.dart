part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchDataEvent extends PostEvent {
  @override
  List<Object> get props => null;
}

class TitleErrorEvent extends PostEvent {
  final String value;
  TitleErrorEvent({@required this.value});
  @override
  List<Object> get props => null;
}

class BodyErrorEvent extends PostEvent {
  final String value;
  BodyErrorEvent({@required this.value});
  @override
  List<Object> get props => null;
}
