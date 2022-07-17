import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/screens/todolist/components/body.dart';

class TodoTaskItem extends StatelessWidget {
  final Function onCheck;
  final Function onHold;

  final Todo todo;

  const TodoTaskItem(
      {Key? key,
      required this.onCheck,
      required this.todo,
      required this.onHold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          onCheck(todo);
        },
        onLongPress: () {
          onHold(todo);
        },
        child: Container(
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
          child: Row(
            children: [
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryPink, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    height: todo.isDone ? 30 : 0,
                    width: todo.isDone ? 30 : 0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryPink,
                    ),
                  ),
                  AnimatedScale(
                    scale: todo.isDone ? 1 : 0,
                    duration: Duration(milliseconds: 100),
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
