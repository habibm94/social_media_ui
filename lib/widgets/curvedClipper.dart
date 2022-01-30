import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curvedpoint1 = Offset(size.width / 4, size.height);
    Offset centerpoint = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
        curvedpoint1.dx, curvedpoint1.dy, centerpoint.dx, centerpoint.dy);

    Offset curvedpoint2 = Offset((size.width / 4) * 3, size.height / 2);
    Offset endpoint = Offset(size.width, 3 * size.height / 5);
    path.quadraticBezierTo(
        curvedpoint2.dx, curvedpoint2.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
