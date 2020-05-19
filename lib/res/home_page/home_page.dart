import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_get_post/bloc/post/post_bloc.dart';
import 'package:test_get_post/models/post_with_comment_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostBloc _postBloc;
  @override
  void initState() {
    super.initState();
    _postBloc = BlocProvider.of<PostBloc>(context);
    _postBloc.add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocListener<PostBloc, PostState>(
          listener: (BuildContext context, PostState state) {
            if (state is ErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorText),
                ),
              );
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
              builder: (BuildContext context, PostState state) {
            if (state is PostInitialState) {
              return buildLoading();
            } else if (state is LoadingState) {
              return buildLoading();
            } else if (state is LoadedState) {
              return buildArticleList(state.data);
            } else if (state is ErrorState) {
              return buildErrorUi(state.errorText);
            } else {
              return buildLoading();
            }
          }),
        ),
      ),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}

Widget buildArticleList(List<PostWithCommentModel> post) {
  return ListView.builder(
    itemCount: post.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(post[index].title),
                subtitle: Text(post[index].body),
              ),
              ExpandablePanel(
                header: Text('data'),
                expanded: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: post[index].comments.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return ListTile(
                      title: Text('$idx ${post[index].comments[idx].name}'),
                      // subtitle: Text(post[index].comments[idx].body),
                    );
                  },
                ),
              )
            ],
          ),
          onTap: () {},
        ),
      );
    },
  );
}
