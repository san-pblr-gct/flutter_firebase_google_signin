import 'package:firebase_google_signin/pages/login.dart';
import 'package:firebase_google_signin/statemodel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_google_signin/statewidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomePage> {
  StateModel appState;

  Widget _buildStories({Widget body}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(20.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(appState.user.photoUrl.toString()),
                  ),
                )),
            new Text(
              'Welcome, ' '${appState.user.displayName}' '!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            RaisedButton(
                onPressed: () => StateWidget.of(context).signOut(),
                padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                color: const Color(0xFFFFFFFF),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Text(
                          "Sign out",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
          ],
        )),
      ),
    );
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildLoadingIndicator();
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginPage();
    } else {
      return _buildStories();
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build the content depending on the state:
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}
