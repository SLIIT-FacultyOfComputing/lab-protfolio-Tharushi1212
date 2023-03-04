import 'package:flutter/material.dart';
import 'package:labactivity/screens/authenticate/authenticate.dart';
import 'package:labactivity/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return home or sign in and sign up widget
    return Authenticate();
  }
}
