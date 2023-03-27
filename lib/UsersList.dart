// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';

class usersList extends StatefulWidget {
  const usersList({super.key});

  @override
  State<usersList> createState() => _usersListState();
}

class _usersListState extends State<usersList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Users List'),
        ),
      ),
    );
  }
}
