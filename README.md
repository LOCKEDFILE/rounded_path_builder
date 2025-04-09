# Rounded Path

A Flutter utility package to create `Path` from a list of `Offset`s with rounded corners.

## Features

- Convert a list of points into a smooth polygonal path
- Apply rounded corners with a configurable radius

## Usage

```dart
import 'package:rounded_path/rounded_path.dart';

final path = RoundedPathBuilder.fromPoints(
  [
    Offset(0, 0),
    Offset(100, 0),
    Offset(100, 100),
    Offset(0, 100),
  ],
  cornerRadius: 10,
);
```



## Example

~~~dart

class RoundedPathExample extends StatelessWidget {
  const RoundedPathExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: _RoundedPainter(),
    );
  }
}

class _RoundedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(20, 20),
      Offset(size.width - 20, 20),
      Offset(size.width - 20, size.height - 20),
      Offset(20, size.height - 20),
    ];

    final path = RoundedPathBuilder.fromPoints(
      points,
      cornerRadius: 20,
    );

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
~~~

### RRect

```dart
final points = [
  Offset(20, 20),
  Offset(size.width - 20, 20),
  Offset(size.width - 20, size.height - 20),
  Offset(20, size.height - 20),
];

final path = RoundedPathBuilder.fromPoints(
  points,
  cornerRadius: 8,
);
```

![Rounded Path Example](https://raw.githubusercontent.com/lockedfile/rounded_path_builder/main/assets/rrect.png)


### CustomPath

```dart
final points = [
    Offset(0, 0),
    Offset(size.width, 0),
    Offset(size.width, size.height),
    Offset(size.width / 3 + 15, size.height),
    Offset(size.width / 3, size.height - 20),
    Offset(size.width / 3 - 15, size.height),
    Offset(0, size.height),
];


final path = RoundedPathBuilder.fromPoints(
  points,
  cornerRadius: 8,
);
```

![Custom Path Example](https://raw.githubusercontent.com/lockedfile/rounded_path_builder/main/assets/custom.png)
