import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/NewApplicationFormPage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: ListView(
        children: [
          ListTile(
              title: const Text("Submit a new Application"),
              trailing: const Icon(Icons.arrow_circle_right_sharp),
              onTap: () {
                Navigator.of(context).pushNamed(NewApplicationPage.routeName);
              }),
          const ListTile(
            title: Text("See Submitted Application"),
            trailing: Icon(Icons.arrow_circle_right_sharp),
          ),
          const ListTile(
            title: Text("Chack Application Status"),
            trailing: Icon(Icons.arrow_circle_right_sharp),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Signed in as: ' + user!.email!,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: InkWell(
                onTap: () => FirebaseAuth.instance.signOut(),
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  }
