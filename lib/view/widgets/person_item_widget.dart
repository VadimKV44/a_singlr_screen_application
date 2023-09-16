import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/consts/styles.dart';
import 'package:flutter/material.dart';

class PersonItemWidget extends StatelessWidget {
  const PersonItemWidget({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteGreyColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2.0, color: MainColors.kLightGreyColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                person.name!,
                style: MainStyles.kBlackColorW400(24.0),
              ),
              const SizedBox(width: 10.0),
              Text(
                person.surname!,
                style: MainStyles.kBlackColorW400(24.0),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Divider(height: 2.0, color: MainColors.kLightGreyColor),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Age: ${person.age}',
                style: MainStyles.kBlackColorW400(24.0),
              ),
              Text(
                person.gender == Gender.male ? 'Man' : 'Woman',
                style: MainStyles.kBlackColorW400(24.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
