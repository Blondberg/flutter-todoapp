import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/screens/todolist/components/body.dart';

class AddBody extends StatelessWidget {
  final Function addItem;
  final TextEditingController _textController = TextEditingController();
  AddBody({Key? key, required this.addItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Text(
            "Add Task",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  blurRadius: 24,
                  offset: const Offset(0, 0),
                  color: Colors.black.withAlpha(25),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "TASK",
            style: TextStyle(
                color: kSecondaryBlue, letterSpacing: 2, fontSize: 10),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: kPrimaryDark,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 4),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Colors.black.withAlpha(90),
                )
              ],
            ),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
              controller: _textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write your task",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(.4),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                addItem(Todo(isDone: false, title: _textController.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    content: Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Task added!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                );
              }
              _textController.clear();
            },
            child: Container(
              height: 60,
              width: 200,
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: kPrimaryPink,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryPink.withOpacity(.25),
                    offset: const Offset(0, 6),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    offset: const Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Text(
                "Add task",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
