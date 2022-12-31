import 'package:flutter/material.dart';

const mainColor = Color(0xFF425C5A);
const defaultWhite = Color(0xFFFFFFFF);

final defaultBorderRadius = BorderRadius.circular(8);

Map<int, Color> primarySwatch = const {
  50: mainColor,
  100: mainColor,
  200: mainColor,
  300: mainColor,
  400: mainColor,
  500: mainColor,
  600: mainColor,
  700: mainColor,
  800: mainColor,
  900: mainColor,
};

MaterialColor primarySwatchColor = MaterialColor(0xFF425C5A, primarySwatch);

final defaultBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.grey, width: 0),
  borderRadius: defaultBorderRadius,
);

final activeBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: defaultWhite, width: 0),
  borderRadius: defaultBorderRadius,
);
