import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_clone/brand_colors.dart';
import 'package:uber_clone/screens/registration_page.dart';
import 'package:uber_clone/widgets/taxt_button.dart';

class LoginPage extends StatelessWidget {
  static const id = 'loginPage';
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
                  onPressed: () {},
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
