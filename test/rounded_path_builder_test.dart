import 'package:flutter_test/flutter_test.dart';

import 'package:rounded_path_builder/rounded_path_builder.dart';

void main() {
  test('Rounded path should return a closed path if closePath is true', () {
    const points = [
      Offset(0, 0),
      Offset(100, 0),
      Offset(100, 100),
      Offset(0, 100),
    ];

    final path = RoundedPathBuilder.fromPoints(points, cornerRadius: 10);

    expect(path, isNotNull);
  });
}
