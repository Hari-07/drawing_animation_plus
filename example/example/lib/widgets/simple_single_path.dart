import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

class SimpleSinglePath extends StatelessWidget {
  const SimpleSinglePath({Key? key, required this.run, required this.onFinish})
    : super(key: key);
  final bool run;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawing.svg(
      'assets/circle.svg',
      run: run,
      duration: Duration(seconds: 2),
      lineAnimation: LineAnimation.oneByOne,
      animationCurve: Curves.linear,
      onFinish: onFinish,
      paints: [
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill,
      ],
    );
  }
}
