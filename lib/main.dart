import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pubg_tournament_organiser/pages/home_page.dart';
import 'package:pubg_tournament_organiser/pages/home_tab_screen.dart';
//import 'package:pubg_tournament_organiser/pages/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
        theme: new ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.yellow[700]),
                color: Colors.black,
                textTheme: TextTheme(
                  body1: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w400),
                  button: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w600),
                  title: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w700),
                  subtitle: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontFamily: "Teko",
                      fontWeight: FontWeight.w400),
                )),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                    color: Colors.yellow[700],
                    fontSize: 18.0,
                    fontFamily: "Teko",
                    fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 4.0,
                  borderSide: BorderSide(color: Colors.yellow[700], width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: TextStyle(
                    color: Colors.yellow[700],
                    fontSize: 18.0,
                    fontFamily: "Teko",
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  gapPadding: 4.0,
                  borderSide: BorderSide(color: Colors.yellow[300], width: 2.0),
                  borderRadius: BorderRadius.circular(0.0),
                )),
            scaffoldBackgroundColor: Color(0xFF444444),
            textTheme: TextTheme(
                body1: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: "Teko",
                    fontWeight: FontWeight.w400)),
            backgroundColor: Colors.yellow[600],
            primarySwatch: Colors.grey,
            primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.all(5.0),
              buttonColor: Colors.yellow[600],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.yellow[300],
                      width: 3.0)),
            ),
            cardTheme: CardTheme(
                shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.yellow[300])))));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.currentUser().then((onValue) {
      if (onValue == null) {
        print("onValue  null");
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => new HomeScreen()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => new HomeTabs()));
      } else {
        print("onValue null");
        try {
          print("Provider id:${onValue.uid}");
          //_auth.signOut();
        } catch (e) {
          print(e);
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => new HomeTabs()));
      }
    });
    return new Scaffold(
      body: new Center(
        child: new Text("Loading..."),
      ),
    );
  }
}
