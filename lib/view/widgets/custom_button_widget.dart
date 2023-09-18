import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/consts/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kWhiteGreyColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2.0, color: MainColors.kLightGreyColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Age sort',
              style: MainStyles.kBlackColorW400(24.0),
            ),
          ),
        ),
      ),
    );
  }
}
