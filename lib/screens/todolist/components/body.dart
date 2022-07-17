import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/screens/todolist/add/add_screen.dart';
import 'package:flutter_todo/screens/todolist/components/category_progress_view.dart';
import 'package:flutter_todo/screens/todolist/components/todo_task_item.dart';
import 'package:intl/intl.dart';

class TodoBody extends StatefulWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  List<Todo> todayTaskItems = <Todo>[];

  int todayTaskCount = 0;
  int todayCompletedCount = 0;

  void onCheck(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      todayCompletedCount =
          todo.isDone ? todayCompletedCount + 1 : todayCompletedCount - 1;
    });
  }

  void createTaskList() async {
    todayTaskItems.add(Todo(title: "Do laundry", isDone: false));
    todayTaskItems.add(Todo(title: "Cook", isDone: false));
    todayTaskItems.add(Todo(title: "Pee", isDone: false));

    todayTaskCount = todayTaskItems.length;
  }

  void addItem(Todo item) {
    setState(() {
      todayTaskItems.add(item);
      todayTaskCount = todayTaskItems.length;
    });
  }

  void onHold(Todo todo) {
    setState(() {
      todayTaskItems.remove(todo);
      todayTaskCount = todayTaskItems.length;
      if (todo.isDone) todayCompletedCount--;
    });
  }

  @override
  void initState() {
    createTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                alignment: Alignment.centerLeft,
                height: 50,
                margin: const EdgeInsets.only(bottom: 10),
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Text(
                "Simon's Todo",
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
                "CATEGORIES",
                style: TextStyle(
                    color: kSecondaryBlue, letterSpacing: 2, fontSize: 10),
              ),
              const SizedBox(
                height: 20,
              ),
              const CategoryProgressView(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            "TODAY'S TASKS, ${DateFormat('EEE,  d MMM y').format(
                          DateTime.now(),
                        )}",
                        style: const TextStyle(
                            color: kSecondaryBlue,
                            letterSpacing: 2,
                            fontSize: 10),
                        children: [
                          TextSpan(
                            text: " [$todayCompletedCount/$todayTaskCount]",
                            style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              kPrimaryBackground,
                              Colors.transparent,
                            ],
                            stops: [
                              0.0,
                              0.05,
                            ],
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: todayTaskItems.isEmpty
                            ? Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Looks like you don't have any tasks!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white.withOpacity(.8),
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
                              )
                            : ListView.builder(
                                itemCount: todayTaskItems.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: ((context, index) {
                                  return TodoTaskItem(
                                    todo: todayTaskItems[index],
                                    onCheck: onCheck,
                                    onHold: onHold,
                                  );
                                }),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddScreen(addItem: addItem),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: kPrimaryPink,
                shape: BoxShape.circle,
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
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class Todo {
  Todo({required this.title, required this.isDone});
  final String title;
  bool isDone;
}
