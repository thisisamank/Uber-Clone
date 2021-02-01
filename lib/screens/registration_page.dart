import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_clone/brand_colors.dart';
import 'package:uber_clone/screens/login_page.dart';
import 'package:uber_clone/widgets/taxt_button.dart';

class RegistrationPage extends StatelessWidget {
  static const id = 'registerPage';

  var _emailController = TextEditingController();
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    "Register as a Rider",
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
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hoverColor: BrandColors.colorGreen,
                            focusColor: BrandColors.colorGreen,
                            labelText: "Full Name",
                            labelStyle: TextStyle(
                              fontFamily: 'Brand-Regular',
                              fontSize: 15,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _emailController,
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
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hoverColor: BrandColors.colorGreen,
                            focusColor: BrandColors.colorGreen,
                            labelText: "Phone",
                            labelStyle: TextStyle(
                              fontFamily: 'Brand-Regular',
                              fontSize: 15,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _passwordController,
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
                    title: 'REGISTER',
                    onPressed: () {
                      if (_nameController.text.length < 3) {
                        showSnackbar(title: 'Please Enter Correct Name');
                        return;
                      }
                      if (!_emailController.text.contains('@')) {
                        showSnackbar(title: 'Please Enter Correct email');
                        return;
                      }
                      if (_passwordController.text.length < 8) {
                        showSnackbar(
                            title: 'Enter password of more than 8 chatacter');
                        return;
                      }
                      if (_phoneController.text.length < 10) {
                        showSnackbar(title: 'Enter Correct phone number!');
                        return;
                      }
                      registerUser();
                    },
                    color: BrandColors.colorGreen,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.id, (route) => false);
                    },
                    child: Center(
                      child: Text(
                        "Already have a RIDER Account? Log in",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  registerUser() async {
    var user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text));
    if (user != null) {
      print("Registered");
    }
  }

  showSnackbar({title}) {
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
}
