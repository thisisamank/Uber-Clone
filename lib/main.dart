import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/main_page.dart';
import 'package:uber_clone/screens/login_page.dart';
import 'package:uber_clone/screens/registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app;
  try {
    if (Firebase.apps.length != null) {
      app = await Firebase.initializeApp();
    } else {
      app = await Firebase.initializeApp(
        name: 'db',
        options: Platform.isIOS || Platform.isMacOS
            ? FirebaseOptions(
                appId: '1:297855924061:ios:c6de2b69b03a5be8',
                apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
                projectId: 'flutter-firebase-plugins',
                messagingSenderId: '297855924061',
                databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
              )
            : FirebaseOptions(
                appId: '1:970767880288:android:9a42b4d5e6f8282bfc7305',
                apiKey: 'AIzaSyAlWqloCLazfh2kP532lU4Et-mGB0mqdzw',
                messagingSenderId: '297855924061',
                projectId: 'uber-clone-add12',
                databaseURL:
                    'https://uber-clone-add12-default-rtdb.firebaseio.com',
              ),
      );
    }
  } catch (_) {
    print(_.toString);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Brand-Regular',
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
      },
    );
  }
}
