import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Row(children: <Widget>[
        Expanded(
            child: Divider(
          thickness: 2,
        )),
        Text(
          " or ",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 18.0,
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 2,
        )),
      ]),
    );
  }
}
