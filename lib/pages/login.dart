import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_google_signin/statewidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              onPressed: () => StateWidget.of(context).signIn(),
              padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
              color: const Color(0xFFFFFFFF),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new Text(
                        "Sign in with Google",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )),
                ],
              )),
        ],
      )),
    );
  }
}
