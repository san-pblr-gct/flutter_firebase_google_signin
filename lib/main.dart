import 'package:flutter/material.dart';
import 'package:firebase_google_signin/pages/login.dart';
import 'package:firebase_google_signin/pages/home.dart';
import 'package:firebase_google_signin/statewidget.dart';

void main() {
  StateWidget stateWidget = new StateWidget(child: new MyApp());
  runApp(stateWidget);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GoogleSignIn',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginPage(),
        });
  }
}
