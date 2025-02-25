import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyBQU7vsn-xK3Havl0QMbhec_OI6Nsa3omU",
          appId: "1:747800228195:android:761580a64eb43268976356",
          messagingSenderId: "747800228195",
          projectId: "zoom-app-b5738",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
      routes: {
        '/login_screen': (context) => const LoginScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
