import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/screens/todolist/todolist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryBackground,
        fontFamily: "Comfortaa",
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const TodolistScreen(),
    );
  }
}
