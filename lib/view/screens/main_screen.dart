import 'package:a_single_screen_application/model/local_storage/local_storage.dart';
import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/widgets/custom_text_field_widget.dart';
import 'package:a_single_screen_application/view/widgets/person_item_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomTextFieldWidget(
                  controller: _controller,
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0),
                  itemBuilder: (context, index) {
                    return PersonItemWidget(person: persons[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
