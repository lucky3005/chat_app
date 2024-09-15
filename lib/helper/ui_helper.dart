import 'package:flutter/material.dart';

class UiHelper {
  static TextFields(
      var value, var icon, var txt, bool obsecure, var iconColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: value,
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          label: Text(
            txt,
            style: TextStyle(color: iconColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  static TextWidget(String txt, var bolditalic,var size) {
    return Text(
      txt,
      style: TextStyle(fontSize: size,fontWeight: bolditalic),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext contextz) {
        return AlertDialog(
          title: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

var bgColor = const Color.fromARGB(255, 241, 254, 255);
var splashColor = const Color.fromARGB(255, 19, 171, 188);
var appBarColor = Colors.deepPurpleAccent;

// ignore: prefer_typing_uninitialized_variables
var a = 0.0, b = 0.0, c = 0.0, d = 0.0;
