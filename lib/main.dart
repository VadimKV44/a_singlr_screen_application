import 'package:a_single_screen_application/model/local_storage/hive_storage.dart';
import 'package:a_single_screen_application/view/consts/colors.dart';
import 'package:a_single_screen_application/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: HiveStorage.openTaskBox(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const MainScreen();
          } else {
            return Container(
              color: MainColors.kBlackColor,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
