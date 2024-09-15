import 'dart:io';

import 'package:chat_app/loginSignup/login_screen.dart';
import 'package:chat_app/loginSignup/sign_up_page.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyABMdCo5i0PAYJjqs9ToagBEy5m-_KR01M",
              appId: "1:130052790726:android:37f7cd3350659f405e3ac7",
              messagingSenderId: "130052790726",
              projectId: "cost-estimation-tool-b3f3f"),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => LoginPage(),
        "signup":(context)=> SignUpPage(),
        "homepage": (context)=> HomePage(),
        "chatscreen": (context)=> ChatScreen(),
      },
    );
  }
}
