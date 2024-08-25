import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start or Join a meeting',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset('images/onboarding.jpg'),
            ),
            CustomButton(
              text: 'Google Sign-In',
              onPressed: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/home_screen');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
