import 'package:flutter/material.dart';
import "dart:math";

class CircleCustomPainer extends CustomPainter {
  var count = 10;
  var backgroundColor = Colors.white;

  CircleCustomPainer({required this.count, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = backgroundColor;
    Paint paint1 = Paint();
    paint1.color = Colors.white;
    paint1.strokeWidth = 1;
    paint1.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.height / 2, paint);

    Path path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    for (var i = 0; i < count; i++) {
      var o = (2 * i * pi) / count;
      var x = 160 * cos(o) + (size.width / 2);
      var y = 160 * sin(o) + (size.height / 2);
      path.lineTo(x, y);
      path.moveTo(size.width / 2, size.height / 2);
    }
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}