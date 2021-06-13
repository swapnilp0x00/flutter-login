import 'package:flutter/material.dart';
import 'package:login/src/screens/login.screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Log ME In',
      home: Scaffold(
        body: LoginScreen()
      ),
    );
  }
}
