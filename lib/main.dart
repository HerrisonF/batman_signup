import 'package:flutter/material.dart';
import 'package:flutter_batman/main_batman_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Batman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainBatmanSignUp(),
    );
  }
}
