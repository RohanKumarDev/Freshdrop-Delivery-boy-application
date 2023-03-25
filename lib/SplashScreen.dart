// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:deliveryapp/HomeScreen.dart';
import 'package:deliveryapp/LoginPage.dart';
import 'package:deliveryapp/noInternet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  bool _isLoggedIn = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      _navigateToPage();
    });
    _checkToken();
    _checkConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        _isConnected = true;
      });
    }
  }

  void _navigateToPage() {
    if (_isConnected) {
      if (_isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => NoInternet()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/logo.png',
        height: 200,
        fit: BoxFit.cover,
      )),
    );
  }
}
