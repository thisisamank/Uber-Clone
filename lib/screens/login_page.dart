import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_clone/brand_colors.dart';
import 'package:uber_clone/main_page.dart';
import 'package:uber_clone/screens/registration_page.dart';
import 'package:uber_clone/widgets/taxt_button.dart';

class LoginPage extends StatefulWidget {
  static const id = 'loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _emailController = TextEditingController();
  var _auth = FirebaseAuth.instance;
  var _passwordController = TextEditingController();

  void login() async {
    final User user = (await _auth
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .catchError((err) {
      PlatformException exception = err;
      showSnackbar(title: exception.message);
    }))
        .user;

    if (user != null) {
      DatabaseReference userRef =
          FirebaseDatabase.instance.reference().child('users/${user.uid}');
      userRef.once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (_) => false);
        }
      });
    }
  }

  void showSnackbar({title}) {
    final snackbar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/logo.png'),
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 40),
                Text(
                  "Sign in as a Rider",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Brand-Bold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hoverColor: BrandColors.colorGreen,
                          focusColor: BrandColors.colorGreen,
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: 'Brand-Regular',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hoverColor: BrandColors.colorGreen,
                          focusColor: BrandColors.colorGreen,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontFamily: 'Brand-Regular',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TaxiButton(
                  color: BrandColors.colorGreen,
                  onPressed: () async {
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    if (connectivityResult != ConnectivityResult.mobile &&
                        connectivityResult != ConnectivityResult.wifi) {
                      showSnackbar(title: 'No Internet Available');
                      return;
                    }
                    login();
                  },
                  title: 'LOGIN',
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RegistrationPage.id, (route) => false);
                  },
                  child: Center(
                    child: Text(
                      "Don't have an Account? Register",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
