import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ContactDetails extends StatelessWidget {
  DocumentSnapshot map;
  ContactDetails(this.map);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Text("Heading: ${map["title"]}"),
          new Text("Description: ${map["description"]}"),
          new Text("Price: ${map["price"]}"),
          new Text("Heading: ${map["title"]}"),
          new Text("Heading: ${map["title"]}"),
        ],
      ),
    );
  }
}
