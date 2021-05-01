import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'signHero',
      child: Center(
          child: Container(
        height: 500,
        width: 500,
        color: Colors.deepOrangeAccent,
      )),
    );
  }
}
