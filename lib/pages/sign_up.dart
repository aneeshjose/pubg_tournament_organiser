import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pubg_tournament_organiser/pages/sign_in.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => new SignUpState();
}

class SignUpState extends State<SignUp> {
  String userName, name, emailId, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Sin In"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new TextField(
              onChanged: (text) => name = text,
            ),
            new TextField(
              onChanged: (text) => userName = text,
            ),
            new TextField(
              onChanged: (text) => emailId = text,
            ),
            new TextField(
              onChanged: (text) => password = text,
            ),
            new TextField(
              onChanged: (text) => confirmPassword = text,
            ),
            new RaisedButton(
              onPressed: signUp(),
              child: new Text("Sign UP"),
            ),
            new RaisedButton(
              onPressed: signIn(context),
              child: new Text("Sign In"),
            ),
            new RaisedButton(
              onPressed: signUp(),
              child: new Text("Sign UP"),
            ),
            new RaisedButton(
              onPressed: signInWithGoogle(),
              child: new Text("Sign In with google"),
            ),
          ],
        ),
      ),
    );
  }

  signUp() {
    //todo implementations
  }

  signIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new SignIn()));
  }

  signInWithGoogle() {
    //todo implementation
  }
}
