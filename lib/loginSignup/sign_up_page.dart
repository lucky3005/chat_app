import 'dart:async';

import '/helper/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmcontroller = TextEditingController();
  signUp(String email, String password, String confirmpass) async {
    if (email == "" && password == "" && confirmcontroller.text == "") {
      UiHelper.CustomAlertBox(context, "Enter the required fields");
    } else if (password != confirmpass) {
      UiHelper.CustomAlertBox(context, "Password not matchede");
    } else {
      //
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          UiHelper.CustomAlertBox(context, "Welcome");
          Navigator.pushNamed(context, "homepage");
        });
      } on FirebaseAuthException catch (e) {
        return UiHelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/CostEstimation logo.png',
                height: 100,
                width: 100,
              ),
              UiHelper.TextFields(
                  emailcontroller, Icons.email, "Email", false, Colors.white),
              UiHelper.TextFields(passwordcontroller, Icons.password,
                  "Password", true, Colors.white),
              UiHelper.TextFields(confirmcontroller, Icons.password, "Password",
                  true, Colors.white),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: emailcontroller,
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(
              //         Icons.email,
              //         color: Colors.white,
              //       ),
              //       label: const Text(
              //         'Email',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: passwordcontroller,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(
              //         Icons.password,
              //         color: Colors.white,
              //       ),
              //       label: const Text(
              //         'Password',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: confirmcontroller,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(
              //         Icons.password,
              //         color: Colors.white,
              //       ),
              //       label: const Text('Confirm Password',
              //           style: TextStyle(color: Colors.white)),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, "homepage");
                  signUp(
                      emailcontroller.text.toString(),
                      passwordcontroller.text.toString(),
                      confirmcontroller.text.toString());
                  emailcontroller.clear();
                  passwordcontroller.clear();
                  confirmcontroller.clear();
                },
                child: const Text('SignUp'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      emailcontroller.clear();
                      passwordcontroller.clear();
                      confirmcontroller.clear();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
