import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pubg_tournament_organiser/pages/create_tournament.dart';
import 'package:pubg_tournament_organiser/pages/home_page.dart';
import 'package:pubg_tournament_organiser/pages/account.dart';
import 'package:pubg_tournament_organiser/pages/sign_up.dart';

class HomeTabs extends StatefulWidget {
  @override
  HomeTabsState createState() => new HomeTabsState();
}

class HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
    FirebaseAuth.instance.currentUser().then((onValue) {
      if (onValue == null) {
        print("Not signed in");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new SignUp()));
      } else {
        print(
            "Signed in as ${onValue.displayName} with email ${onValue.email}");
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new TabBar(
        indicatorColor: Colors.yellow[800],
        labelColor: Colors.yellow[100],
        controller: controller,
        tabs: <Widget>[
          new Tab(
            child: Icon(
              Icons.ac_unit,
              color: Colors.yellow[400],
            ),
          ),
          new Tab(
            child: Icon(
              Icons.account_box,
              color: Colors.yellow[400],
            ),
          ),
          new Tab(
            child: Icon(
              Icons.gamepad,
              color: Colors.yellow[400],
            ),
          ),
        ],
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new MyAccount(),
          new HomeScreen(),
          new CreateTournament()
        ],
      ),
    );
  }
}
