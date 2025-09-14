import 'package:flutter/material.dart';

import 'debug.dart';
import 'line_animation.dart';
import 'painter.dart';
import 'parser.dart';

class PathPainterBuilder {
  PathPainterBuilder([LineAnimation? lineAnimation]) {
    this.lineAnimation = lineAnimation!;
  }
  late List<Paint> paints;
  void Function(int currentPaintedPathIndex)? onFinishFrame;
  late bool scaleToViewport;
  late DebugOptions debugOptions;
  late List<Path> paths;
  @Deprecated('Use [paths] instead')
  late List<PathSegment> pathSegments;
  late LineAnimation lineAnimation;
  late Animation<double> animation;
  Size? customDimensions;

  PathPainter build() {
    switch (lineAnimation) {
      case LineAnimation.oneByOne:
        return OneByOnePainter(animation, pathSegments, paths, customDimensions,
            paints, onFinishFrame, scaleToViewport, debugOptions);
      case LineAnimation.allAtOnce:
        return AllAtOncePainter(animation, pathSegments, customDimensions,
            paints, onFinishFrame, scaleToViewport, debugOptions);
      default:
        return PaintedPainter(animation, pathSegments, customDimensions, paints,
            onFinishFrame, scaleToViewport, debugOptions);
    }
  }

  void setAnimation(Animation<double> animation) {
    this.animation = animation;
  }

  void setCustomDimensions(Size? customDimensions) {
    this.customDimensions = customDimensions;
  }

  void setPaints(List<Paint> paints) {
    this.paints = paints;
  }

  void setOnFinishFrame(
      void Function(int currentPaintedPathIndex) onFinishFrame) {
    this.onFinishFrame = onFinishFrame;
  }

  void setScaleToViewport(bool scaleToViewport) {
    this.scaleToViewport = scaleToViewport;
  }

  void setDebugOptions(DebugOptions debug) {
    debugOptions = debug;
  }

  @Deprecated('Use [setPath] instead')
  void setPathSegments(List<PathSegment> pathSegments) {
    this.pathSegments = pathSegments;
  }

  void setPaths(List<Path> paths) {
    this.paths = paths;
  }
}
