// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

class MyClips extends CustomClipper<Path> {
  List<Offset> _extractPoints(String clipPath, Size size) {
    final points = List<Offset>.empty(growable: true);

    var tempString = clipPath.replaceAll("%", "");
    tempString = tempString.replaceAll(", ", ",");

    final pointStrings = tempString.split(",");

    for (final pointString in pointStrings) {
      final coord = pointString.split(" ");

      if (coord.length == 2) {
        points.add(
          Offset(
            (double.parse(coord[0]) * size.width / 100),
            (double.parse(coord[1]) * size.height / 100),
          ),
        );
      }
    }

    return points;
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    final clipPath =
        "20% 0%, 80% 0%, 100% 20%, 100% 80%, 80% 100%, 20% 100%, 0% 80%, 0% 20%";

    final points = _extractPoints(clipPath, size);

    path.addPolygon(points, true);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
