import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_get_post/base_components/big_round_textfield.dart';
import 'package:test_get_post/bloc/post/post_bloc.dart';
import 'package:test_get_post/models/post_model.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String _title = "";
  String _body = "";
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
            BigRoundTextField(
              hintText: 'Tile',
              keyboardType: TextInputType.text,
              onChanged: (val) {
                setState(() {
                  _title = val;
                });
              },
            ),
            SizedBox(height: 20),
            BigRoundTextField(
              hintText: 'Description',
              keyboardType: TextInputType.text,
              onChanged: (val) {
                setState(() {
                  _body = val;
                });
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                UpdatePostParameters parameters =
                    UpdatePostParameters(_id, _body, _title);
                _bloc.repository.updateMyPlace(_id, parameters);
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
