import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateTournament extends StatefulWidget {
  @override
  createState() => new _PostTournamentState();
}

class _PostTournamentState extends State<CreateTournament> {
  List<String> _levels = [
    'Bronze',
    'Silver',
    'Gold',
    'Platinum',
    'Diamond',
    'Crown',
    'Ace',
    'Conqueror'
  ];
  String title,
      description,
      location,
      cost,
      price,
      countryCode,
      country,
      countryVal = 'in',
      level = "Bronze";
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new ListView(children: <Widget>[
        Container(height: 10.0),
        new TextField(
          style: TextStyle(color: Colors.yellow[700]),
          onChanged: (text) => title = text,
          decoration: InputDecoration(
            labelText: 'Tournament Title',
          ),
        ),
        Container(height: 10.0),
        new TextField(
          style: TextStyle(color: Colors.yellow[700]),
          onChanged: (text) => description = text,
          decoration: InputDecoration(
            labelText: 'Description',
          ),
        ),
        Container(height: 10.0),
        new Row(
          children: <Widget>[
            CountryPickerDropdown(
              initialValue: countryVal,
              itemBuilder: _buildDropdownItem,
              onValuePicked: (Country country) {
                print("${country.name}");
                setState(() {
                  countryVal = country.isoCode;
                });
              },
            ),
            Container(width: 20.0),
            Container(
              child: DropdownButton<String>(
                value: level,
                elevation: 16,
                onChanged: (String newValue) {
                  setState(() {
                    level = newValue;
                  });
                },
                items: _levels.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 15.0,
                            fontFamily: "Teko",
                            fontWeight: FontWeight.w600)),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Container(height: 10.0),
        new TextField(
          style: TextStyle(color: Colors.yellow[700]),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Cost',
          ),
          onChanged: (text) => cost = text,
        ),
        Container(height: 10.0),
        new TextField(
          style: TextStyle(color: Colors.yellow[700]),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Price',
          ),
          onChanged: (text) => price = text,
        ),
        Container(height: 10.0),
        new RaisedButton(
          padding: EdgeInsets.all(20.0),
          onPressed: () => _postTournament(),
          child: new Text("Post Tournament"),
        )
      ]),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "+${country.phoneCode}(${country.isoCode})",
              style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 15.0,
                  fontFamily: "Teko",
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  void _postTournament() {
    print("Started");
    FirebaseAuth.instance.currentUser().then((fireBaseUser) {
      Firestore.instance.collection("tournaments").add({
        "user": "Aneesh Jose",
        "level": level,

        "price": price,
        //"uid": fireBaseUser.uid,
        "uid": "6pI4ntDc1jWIiejpqBjjrajoXfm1",
        "title": title,
        "cost": cost,
        "description": description
      }).then((onValue) {
        print("Collected $onValue");
        Navigator.pop(context);
      }).catchError((onError) {
        print("Error posting data $onError");
      });
    });
  }
}
