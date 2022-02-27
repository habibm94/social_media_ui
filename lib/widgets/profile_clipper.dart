import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 5 * size.height / 6);
    Offset curvedPoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, 5 * size.height / 6);
    path.quadraticBezierTo(
        curvedPoint.dx, curvedPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
