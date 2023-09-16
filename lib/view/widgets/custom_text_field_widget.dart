import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/consts/strings.dart';
import 'package:a_single_screen_application/view/consts/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: MainStyles.kBlackColorW400(20.0),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
        filled: true,
        fillColor: MainColors.kWhiteGreyColor,
        hintText: Strings.search,
        hintStyle: MainStyles.kLightGreyColorW400(20.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 2.0, color: MainColors.kLightGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 2.0, color: MainColors.kLightGreyColor),
        ),
      ),
    );
  }
}
