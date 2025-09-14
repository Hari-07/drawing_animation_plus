import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

class MultiPathAllAtOnce extends StatelessWidget {
  const MultiPathAllAtOnce({
    super.key,
    required this.run,
    required this.onFinish,
  });
  final bool run;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawing.svg(
      'assets/circles_2.svg',
      run: run,
      duration: Duration(seconds: 2),
      lineAnimation: LineAnimation.allAtOnce,
      animationCurve: Curves.linear,
      onFinish: onFinish,
      paints: [Paint()..color = Colors.red],
    );
  }
}
