import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccount extends StatefulWidget {
  MyAccountState createState() => new MyAccountState();
}

class MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Account info"),
    );
  }
}
