import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:flutter/material.dart';

abstract class MainStyles {
  static TextStyle kBlackColorW400(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: MainColors.kBlackColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle kLightGreyColorW400(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: MainColors.kLightGreyColor,
      fontWeight: FontWeight.w400,
    );
  }
}