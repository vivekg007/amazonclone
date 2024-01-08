import 'package:flutter/cupertino.dart';

class CommonFunctions {
  static blankSpace({required double? height, required double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
