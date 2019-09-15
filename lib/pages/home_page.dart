import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pubg_tournament_organiser/pages/create_tournament.dart';
import 'contact_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _listWidget = new Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text("Loading...",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: "Teko",
                fontWeight: FontWeight.w600)),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PUBG Tournaments"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(height: 20.0),
            _listWidget,
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchTournaments();
  }

  void fetchTournaments() async {
    await Firestore.instance
        .collection('tournaments')
        .getDocuments()
        .then((onValue) {
      setState(() {
        _listWidget = new ListView.builder(
            itemCount: onValue.documents.length,
            shrinkWrap: true,
            padding:
                EdgeInsets.only(left: 1.0, right: 1.0, top: 2.0, bottom: 5.0),
            itemBuilder: (context, index) {
              return new Card(
                child: new Column(
                  children: <Widget>[
                    new Text(onValue.documents[index]["title"]),
                    new Text("level:${onValue.documents[index]["level"]}"),
                    new Text("Ticket fee:${onValue.documents[index]["cost"]}"),
                    new Text(
                        "Price money:${onValue.documents[index]["price"]}"),
                    new RaisedButton(
                      //color: Color(0xFF666666),
                      color: Colors.yellow[600],
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ContactDetails(
                                  onValue.documents[index]))),
                      child: new Text("Contact",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: "Teko",
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              );
            });
      });

      //return onValue.documents;
    }).catchError((onError) {
      print("Error occured as : $onError");
      //return onError;
    });
  }
}
