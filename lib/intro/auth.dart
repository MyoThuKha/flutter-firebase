import "package:flutter/material.dart";
import 'package:flutter_firebase/intro/login.dart';
import 'package:flutter_firebase/intro/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignUp = false;

  void handleChange() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignUp
        ? SignUp(toggle: handleChange)
        : LogIn(toggle: handleChange);
  }
}
