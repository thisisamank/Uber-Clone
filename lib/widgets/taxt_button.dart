import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  TaxiButton({this.color, this.onPressed, this.title});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
