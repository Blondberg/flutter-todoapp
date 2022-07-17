import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/todolist/add/components/body.dart';
import 'package:flutter_todo/screens/todolist/components/body.dart';

class AddScreen extends StatelessWidget {
  final Function addItem;
  const AddScreen({
    Key? key,
    required this.addItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddBody(addItem: addItem),
    );
  }
}
