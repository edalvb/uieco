import 'package:flutter/material.dart';

double Function(double) mySize(BuildContext context) {
  return (num size) {
    const razon = 0.0014632718759145;
    if (size == 0 || size == null) return 0;
    return size * razon * MediaQuery.of(context).size.height;
  };
}
