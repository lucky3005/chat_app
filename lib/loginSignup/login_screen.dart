import '/helper/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    login(String email, String password) async {
      if (email == "" && password == "") {
        UiHelper.CustomAlertBox(context, "Enter required fields");
      } else {
        try {
          UserCredential? usercredential;
          usercredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password)
              .then((value) {
            UiHelper.CustomAlertBox(context, "Welcome");
            Navigator.pushNamed(context, "homepage");
          });
        } on FirebaseAuthException catch (e) {
          return UiHelper.CustomAlertBox(context, e.code.toString());
        }
      }
    }

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
              //  TextFields(var value, var icon, var txt, bool obsecure)
              UiHelper.TextFields(
                emailcontroller, Icons.email, "Email", false,Colors.white),
              UiHelper.TextFields(
                  passwordcontroller, Icons.password, "Password", true,Colors.white),

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
              //       label: const Text('Password',
              //           style: TextStyle(color: Colors.white)),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                  emailcontroller.clear();
                  passwordcontroller.clear();
                  // Navigator.pushNamed(context, "homepage");
                },
                child: const Text('Login'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "signup");
                      emailcontroller.clear();
                      passwordcontroller.clear();
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "homepage");
          },
          child: Text("Skip")),
    );
  }
}
