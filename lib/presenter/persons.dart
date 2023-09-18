import 'package:a_single_screen_application/model/local_storage/hive_storage.dart';
import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:rxdart/rxdart.dart';

class Persons {
  List<Person> _persons = [];

  List<Person> get count => _persons;

  Persons(this._persons) : personsUpdate = BehaviorSubject<List<Person>>.seeded(_persons);

  final BehaviorSubject<List<Person>> personsUpdate;

  Future readPersons() async {
    _persons.addAll(HiveStorage.readPersons());
    personsUpdate.add(_persons);
  }
}