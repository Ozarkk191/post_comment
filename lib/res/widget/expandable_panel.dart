import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableList extends StatelessWidget {
  final String header;
  final String name;
  final String body;

  const ExpandableList({
    Key key,
    @required this.header,
    @required this.name,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Container(
        height: 40,
        child: Center(child: Text(header)),
      ),
      collapsed: collapsedContainer(context),
      expanded: expandedContainer(context),
    );
  }

  Container collapsedContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: Colors.black,
    );
  }

  Container expandedContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$name', style: TextStyle(fontSize: 12)),
          Text('$body', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
