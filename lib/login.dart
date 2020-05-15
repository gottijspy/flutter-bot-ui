import 'package:flutter/material.dart';
import 'package:flutterbotui/widgets/divider_or.dart';
import 'package:flutterbotui/widgets/login_email_form.dart';
import 'package:flutterbotui/widgets/login_faceid.dart';

// class LoginPage extends StatefulWidget{
//   @override
//   _LoginPageState createState => _LoginPageState();
// }

//class _LoginPageState extends State<LoginPage> {
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "FIO Labs",
            style: TextStyle(fontSize: 24),
          ),
          leading: IconButton(
            icon: Image.asset('assets/fio-logo.png'),
            onPressed: () {},
          ),
        ),
        body: new Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "FIO Bot - Virtual HR Assistant",
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
              Image.asset(
                "assets/fio-bot.gif",
                width: 192,
                height: 144,
              ),
              LoginFaceIdButton(),
              DividerOR(),
              LoginWithEmailForm(),
            ],
          )),
        ));
  }
}
