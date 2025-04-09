library rounded_path_builder;

import 'dart:math';
import 'package:flutter/material.dart';

class RoundedPathBuilder {
  /// Creates a path from given [points] with rounded corners.
  static Path fromPoints(
    List<Offset> points, {
    double cornerRadius = 0.0,
    bool closePath = true,
  }) {
    final path = Path();

    if (points.length < 2) return path;

    Offset getOffsetAlongLine(Offset from, Offset to, double distance) {
      final dx = to.dx - from.dx;
      final dy = to.dy - from.dy;
      final length = sqrt(dx * dx + dy * dy);
      if (length == 0) return from;
      final scale = distance / length;
      return Offset(from.dx + dx * scale, from.dy + dy * scale);
    }

    for (int i = 0; i < points.length; i++) {
      final prev = points[(i - 1 + points.length) % points.length];
      final curr = points[i];
      final next = points[(i + 1) % points.length];

      final p1 = getOffsetAlongLine(curr, prev, cornerRadius);
      final p2 = getOffsetAlongLine(curr, next, cornerRadius);

      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }

      path.quadraticBezierTo(curr.dx, curr.dy, p2.dx, p2.dy);
    }

    if (closePath) {
      path.close();
    }

    return path;
  }
}
