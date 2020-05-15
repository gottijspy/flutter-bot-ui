import 'package:flutter/material.dart';
import 'package:flutterbotui/chat.dart';

class LoginWithEmailForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWithEmailFirmState();
}

class _LoginWithEmailFirmState extends State<LoginWithEmailForm> {
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailField = TextEditingController();
    TextEditingController _passwordField = TextEditingController();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextFormField(
            controller: _emailField,
            validator: (value) => (value.isEmpty) ? "Please Enter Email" : null,
            //style: style,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextFormField(
            controller: _passwordField,
            validator: (value) =>
                (value.isEmpty) ? "Please Enter Password" : null,
            //style: style,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                border: OutlineInputBorder()),
          ),
        ),
        Text(_errorMessage, style: TextStyle(color: Colors.red)),
        Padding(
          padding: const EdgeInsets.all(20),
          child: new FloatingActionButton.extended(
            heroTag: "emailLogin",
            onPressed: () {
              setState(() {
                _errorMessage = '';
              });

              if (_emailField.text != '' && _passwordField.text != '') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              } else {
                setState(() {
                  _errorMessage = "email and/or password required!";
                });
              }
            },
            //icon: Icon(Icons.email),
            label: Text("Sign In"),
          ),
        ),
      ],
    );
  }
}
