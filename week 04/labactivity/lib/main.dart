import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:labactivity/screens/home/authenticate/authenticate.dart';
import 'package:labactivity/screens/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authenticate(),
    );
  }
}
