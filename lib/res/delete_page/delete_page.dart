import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_get_post/base_components/big_round_textfield.dart';
import 'package:test_get_post/bloc/post/post_bloc.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  int _id = 0;

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final PostBloc _bloc = context.bloc<PostBloc>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BigRoundTextField(
              hintText: 'ID',
              keyboardType: TextInputType.number,
              onChanged: (val) {
                setState(() {
                  _id = int.parse(val);
                });
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                _bloc.repository.deleteMyPlace(_id);
              },
              child: Text(
                'DELETE',
              ),
            )
          ],
        ),
      ),
    );
  }
}
