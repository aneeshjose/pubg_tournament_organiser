import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyAccount extends StatefulWidget {
  MyAccountState createState() => new MyAccountState();
}

class MyAccountState extends State<MyAccount> {
  Widget _confirmationWidgets;
  List<Widget> _listWidgets = [];

  bool _isPhoneVerified = false,
      _isAddName = false,
      _isPubgIdEnabled = false,
      _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    if (!_isSignedIn) {
      _listWidgets.add(Card(
        child: new RaisedButton(
          color: Colors.yellow[600],
          onPressed: () => _signIn(),
          child: Text("Sign In to add 30% of completion",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "Teko",
                  fontWeight: FontWeight.w600)),
        ),
      ));
    }
    if (!_isAddName) {
      _listWidgets.add(Card(
        child: new RaisedButton(
          color: Colors.yellow[600],
          onPressed: () => _addName(),
          child: Text("Add Name for 10% of completion",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "Teko",
                  fontWeight: FontWeight.w600)),
        ),
      ));
    }
    if (!_isPhoneVerified) {
      _listWidgets.add(Card(
        child: new RaisedButton(
          color: Colors.yellow[600],
          onPressed: () => _addPhoneNo(),
          child: Text("Add phone number for 30% of completion",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "Teko",
                  fontWeight: FontWeight.w600)),
        ),
      ));
    }
    if (!_isPubgIdEnabled) {
      _listWidgets.add(Card(
        child: new RaisedButton(
          color: Colors.yellow[600],
          onPressed: () => _addPubgId(),
          child: Text("Add PUBG id for 10% of completion",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "Teko",
                  fontWeight: FontWeight.w600)),
        ),
      ));
    }
    _confirmationWidgets = new Column(
      children: _listWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
      children: <Widget>[
        new Center(
          child: new Icon(
            Icons.account_box,
            size: 60.0,
            color: Colors.yellow,
          ),
        ),
        new Center(
            child: new Text("Name",
                style: TextStyle(color: Colors.yellow[700], fontSize: 25.0))),
        new Center(
            child: new Text("@username",
                style: TextStyle(color: Colors.yellow[700], fontSize: 15.0))),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 10.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 18.0,
            percent: 0.2,
            center: Text(
              "Profile completed 20.0%",
              style: TextStyle(color: Colors.amber[800]),
            ),
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.yellow[500],
          ),
        ),
        _confirmationWidgets,
      ],
    ));
  }

  _signIn() {}

  _addName() {}

  _addPhoneNo() {}

  _addPubgId() {}
}
