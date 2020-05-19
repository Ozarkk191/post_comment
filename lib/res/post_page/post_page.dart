import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_get_post/base_components/big_round_textfield.dart';
import 'package:test_get_post/bloc/post/post_bloc.dart';
import 'package:test_get_post/models/post_model.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String _title = "";
  String _body = "";

  bool _ckeck() {
    if (_title == "" && _body == "") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final PostBloc _bloc = context.bloc<PostBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<PostBloc, PostState>(
                builder: (BuildContext context, PostState state) {
              if (state is TitleErrorState) {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: 'Title',
                  onChanged: (value) {
                    _bloc.add(TitleErrorEvent(value: value));
                    _title = value;
                  },
                  errorText: state.errorText,
                );
              } else {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: 'Title',
                  onChanged: (value) {
                    _bloc.add(TitleErrorEvent(value: value));
                    _title = value;
                  },
                );
              }
            }),
            SizedBox(height: 20),
            BlocBuilder<PostBloc, PostState>(
                builder: (BuildContext context, PostState state) {
              if (state is BodyErrorState) {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: 'Description',
                  onChanged: (value) {
                    _bloc.add(BodyErrorEvent(value: value));
                    _body = value;
                  },
                  errorText: state.errorText,
                );
              } else {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: 'Description',
                  onChanged: (value) {
                    _bloc.add(BodyErrorEvent(value: value));
                    _body = value;
                  },
                );
              }
            }),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: !_ckeck()
                  ? null
                  : () {
                      CreatePostParameters parameters =
                          CreatePostParameters(1, _body, _title);
                      _bloc.repository.createMyPlace(parameters);
                    },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
