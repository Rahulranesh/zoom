import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Start or Join a Meeting',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
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
        ),
      )
    );
  }
}
