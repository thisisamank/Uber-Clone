import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              DatabaseReference dbRef =
                  FirebaseDatabase.instance.reference().child('test');
              dbRef.set('Connected');
            },
            child: Text("Check for connection"),
          ),
        ),
      ),
    );
  }
}
