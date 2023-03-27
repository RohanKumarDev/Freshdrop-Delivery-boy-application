// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:deliveryapp/MainHomeScreen.dart';
import 'package:deliveryapp/Orders.dart';
import 'package:deliveryapp/Profile.dart';
import 'package:deliveryapp/UsersList.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _pages = [
    MainHomeScreen(),
    Orders(),
    usersList(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                duration: Duration(milliseconds: 250),
                gap: 8,
                activeColor: Colors.white,
                tabBackgroundGradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 143, 212, 252),
                    Color.fromARGB(255, 11, 125, 192)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                tabs: [
                  GButton(icon: LineIcons.home, text: 'Home'),
                  GButton(icon: LineIcons.shoppingBag, text: 'Orders'),
                  GButton(icon: LineIcons.users, text: 'Users'),
                  GButton(icon: LineIcons.userAlt, text: 'Profile'),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
