import 'package:a_single_screen_application/model/local_storage/adapters/person_adapter.dart';
import 'package:a_single_screen_application/model/local_storage/local_storage.dart';
import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class HiveStorage {
  static Box<Person> personsBox = Hive.box<Person>('personBox');

  static Future<bool> openTaskBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PersonAdapter());
    }
    personsBox = await Hive.openBox('personBox');
    return personsBox.isOpen;
  }

  static Iterable<Person> readPersons() {
    Iterable<Person> data = personsBox.values;
    if (data.isEmpty) {
      savePerson();
    }
    return data;
  }

  static void savePerson() async {
    var uuid = Uuid();
    for (var item in persons) {
      item.id = uuid.v1();
      await personsBox.put(uuid.v1(), item);
    }
  }
}
