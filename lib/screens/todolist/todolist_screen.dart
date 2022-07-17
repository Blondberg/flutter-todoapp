import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/todolist/components/body.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("Hello drawer"),
      ),
      body: TodoBody(),
    );
  }
}
