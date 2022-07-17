import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/screens/todolist/components/category_progress_item.dart';

class CategoryProgressView extends StatelessWidget {
  const CategoryProgressView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CategoryProgressItem(
              headerText: "Personal",
              value: .5,
              indicatorColor: kPrimaryPink,
            ),
            CategoryProgressItem(
              headerText: "Shopping",
              value: .5,
              indicatorColor: Colors.green,
            ),
            CategoryProgressItem(
              headerText: "University",
              value: .8,
              indicatorColor: kPrimaryBlue,
            ),
            CategoryProgressItem(
              headerText: "Personal",
              value: .5,
              indicatorColor: kPrimaryPink,
            ),
          ],
        ),
      ),
    );
  }
}
