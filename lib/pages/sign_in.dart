import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pubg_tournament_organiser/pages/sign_up.dart';

class SignIn extends StatefulWidget {
  SignInState createState() => new SignInState();
}

class SignInState extends State<SignIn> {
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
              onPressed: signUp(context),
              child: new Text("Sign UP"),
            ),
            new RaisedButton(
              onPressed: signIn(context),
              child: new Text("Sign In"),
            ),
            new RaisedButton(
              onPressed: signUp(context),
              child: new Text("Sign UP"),
            ),
            new RaisedButton(
              onPressed: signInWithGoogle(context),
              child: new Text("Sign In with google"),
            ),
          ],
        ),
      ),
    );
  }

  signUp(BuildContext context) {
    //todo implementations
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailId, password: password)
        .then((onValue) {
      if (!onValue.isEmailVerified) {
        print("Email not verified");
        onValue.sendEmailVerification();
      } else {
        Navigator.pop(context);
      }
    });
  }

  signInWithGoogle(BuildContext context) {
    //todo implementation
  }

  signIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new SignUp()));
  }
}
