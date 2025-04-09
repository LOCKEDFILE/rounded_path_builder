import 'package:flutter/material.dart';
import 'package:rounded_path_builder/rounded_path_builder.dart';

class RoundedPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool repaint;
  final List<Offset> Function(Size size) setOffsets;

  const RoundedPainter({
    this.radius = 12.0,
    this.strokeWidth = 3.0,
    this.borderColor,
    this.fillColor,
    this.repaint = false,
    required this.setOffsets,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = RoundedPathBuilder.fromPoints(
      setOffsets(size),
      cornerRadius: radius,
    );

    if (fillColor != null) {
      final fillPaint = Paint()
        ..color = fillColor!
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, fillPaint);
    }

    if (borderColor != null) {
      final strokePaint = Paint()
        ..color = borderColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      canvas.drawPath(path, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => repaint;
}
