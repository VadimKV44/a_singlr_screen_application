import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:a_single_screen_application/presenter/persons.dart';
import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/consts/strings.dart';
import 'package:a_single_screen_application/view/consts/styles.dart';
import 'package:a_single_screen_application/view/widgets/custom_button_widget.dart';
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
  bool sort = false;

  final persons = Persons([]);

  @override
  void initState() {
    super.initState();
    persons.readPersons();
  }

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
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        controller: _controller,
                        onChanged: (value) {
                          persons.search(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    CustomButtonWidget(
                      onTap: () {
                        sort = ! sort;
                        persons.sort(sort);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: persons.personsUpdate,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data?.length,
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0),
                            itemBuilder: (context, index) {
                              List<Person>? persons = snapshot.data;
                              return PersonItemWidget(person: persons![index]);
                            },
                          )
                        : Text(
                            Strings.noData,
                            style: MainStyles.kBlackColorW400(30.0),
                          );
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
