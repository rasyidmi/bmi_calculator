import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  ReuseCard({@required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
