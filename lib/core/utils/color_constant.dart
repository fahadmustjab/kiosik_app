import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black900 = fromHex('#000000');

  static Color lightBlueA700 = fromHex('#0084ff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color lightBlueA4007c = fromHex('#7c00c1ff');

  static Color lightBlueA4007c01 = fromHex('#7c00c2ff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
