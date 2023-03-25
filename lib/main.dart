import 'package:deliveryapp/HomeScreen.dart';
import 'package:deliveryapp/LoginPage.dart';
import 'package:deliveryapp/SplashScreen.dart';
import 'package:deliveryapp/noInternet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/noInternet': (context) => NoInternet(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
