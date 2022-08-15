import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(33, 150, 243, .1),
  100: const Color.fromRGBO(33, 150, 243, .2),
  200: const Color.fromRGBO(33, 150, 243, .3),
  300: const Color.fromRGBO(33, 150, 243, .4),
  400: const Color.fromRGBO(33, 150, 243, .5),
  500: const Color.fromRGBO(33, 150, 243, .6),
  600: const Color.fromRGBO(33, 150, 243, .7),
  700: const Color.fromRGBO(33, 150, 243, .8),
  800: const Color.fromRGBO(33, 150, 243, .9),
  900: const Color.fromRGBO(33, 150, 243, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.red.shade700;

  static MaterialColor customSwatchColor =
      // MaterialColor(0xFF8BC34A, _swatchOpacity);
      MaterialColor(0xFF03A9FA, _swatchOpacity);
}
