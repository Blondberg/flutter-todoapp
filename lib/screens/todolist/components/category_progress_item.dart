import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';

class CategoryProgressItem extends StatefulWidget {
  final double value;
  final Color indicatorColor;
  final String headerText;

  const CategoryProgressItem({
    Key? key,
    required this.value,
    required this.indicatorColor,
    required this.headerText,
  }) : super(key: key);

  @override
  State<CategoryProgressItem> createState() => _CategoryProgressItemState();
}

class _CategoryProgressItemState extends State<CategoryProgressItem>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 30),
      padding: const EdgeInsets.all(20),
      height: 82,
      width: 140,
      decoration: BoxDecoration(
        color: kPrimaryDark,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 4),
              color: Colors.black.withAlpha(90),
              blurRadius: 4,
              spreadRadius: .5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "10 Tasks",
            style: TextStyle(
              color: kSecondaryBlue,
              fontSize: 8,
            ),
          ),
          Text(
            widget.headerText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 2.5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: widget.indicatorColor,
              value: widget.value,
            ),
          ),
        ],
      ),
    );
  }
}
