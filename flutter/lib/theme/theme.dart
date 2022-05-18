import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _primaryColor = Color(0xFFDF0000);

final themeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _primaryColor,
  ),
  textTheme: GoogleFonts.firaSansExtraCondensedTextTheme(),
);

abstract class AppStyle {
  static const padding = 10.0;
  static const edgeInsets = EdgeInsets.all(padding);
  static const colorBlack = Color(0xFF000000);
  static const paleColor = Color(0x40000000);

  static final h1 = GoogleFonts.firaSansExtraCondensed(
    textStyle: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
  );

  static final itemHeader = GoogleFonts.firaSansExtraCondensed(
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );

  static final tag = GoogleFonts.firaSansExtraCondensed(
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );
}

class MySpacing extends StatelessWidget {
  const MySpacing();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 10, height: 10);
  }
}

class HorizontalLineSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppStyle.paleColor,
    );
  }
}