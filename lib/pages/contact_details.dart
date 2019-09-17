import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ContactDetails extends StatefulWidget {
  DocumentSnapshot map;

  ContactDetails(this.map, docId);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  String docId;
  String _roomPassword = "*******";

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((onValue) {
      if (onValue != null) {
        Firestore.instance
            .collection("room_passwords")
            .where('approved', arrayContains: onValue.uid)
            .where('roomid', isEqualTo: docId)
            .getDocuments()
            .then((onValue) {
          if (onValue.documents == [] ||
              onValue == null ||
              onValue.documents.length == 0) {
            print("Not approved");
          } else {
            setState(() {
              _roomPassword = onValue.documents[0].documentID;
            });
          }
        }).catchError((onError) {
          print("Exception $onError");
        });
      } else {
        print("Not approved");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Text("Heading: ${widget.map["title"]}"),
          new Text("Description: ${widget.map["description"]}"),
          new Text("Price: ${widget.map["price"]}"),
          new Text("Maximum level of player: ${widget.map["level"]}"),
          new Text("Cost of a ticket: ${widget.map["cost"]}"),
          new Text("Password of the room: ${_roomPassword}")
        ],
      ),
    );
  }
}
