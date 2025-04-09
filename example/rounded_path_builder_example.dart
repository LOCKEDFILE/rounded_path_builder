import 'package:flutter/material.dart';
import 'package:rounded_path_builder/rounded_paint.dart';

class RoundedPathExample extends StatelessWidget {
  const RoundedPathExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rounded Path Example'),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: RoundedPainter(
            fillColor: Colors.red,
            setOffsets: (Size size) {
              return [
                Offset(0, size.height * 0.2),
                Offset(size.width * 0.2, size.height * 0.4),
                Offset(size.width * 0.4, size.height * 0.6),
                Offset(size.width * 0.6, size.height * 0.4),
                Offset(size.width * 0.8, size.height * 0.2),
              ];
            },
            radius: 20,
          ),
        ),
      ),
    );
  }
}
