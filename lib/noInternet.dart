// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  Future<void> checkInternetAndNavigate() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // no internet connection
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No Internet Connection'),
          ),
        );
      });
    } else {
      // internet connection available
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/phone');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternetAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/noInternet.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Please check your Internet Connection",
            style: TextStyle(
              color: Color.fromARGB(255, 48, 45, 45),
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 20, 137, 247),
                ),
              ),
              onPressed: () {
                checkInternetAndNavigate();
              },
              child: const Text(
                'Reload',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
