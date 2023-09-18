import 'package:a_single_screen_application/model/local_storage/hive_storage.dart';
import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:rxdart/rxdart.dart';

class Persons {
  List<Person> _persons = [];
  List<Person> _filterPersons = [];
  List<Person> _sortPersons = [];

  List<Person> get count => _persons;

  Persons(this._persons) : personsUpdate = BehaviorSubject<List<Person>>.seeded(_persons);

  final BehaviorSubject<List<Person>> personsUpdate;

  void readPersons() {
    _persons.addAll(HiveStorage.readPersons());
    personsUpdate.add(_persons);
  }

  void search(String text) {
    if (text.isNotEmpty) {
      _filterPersons = _persons.where((Person data) {
        return data.name!.toLowerCase().contains(text.toLowerCase());
      }).toList();
      personsUpdate.add(_filterPersons);
    } else {
      personsUpdate.add(_persons);
    }
  }

  void sort(bool sort) {
    if (_sortPersons.isEmpty) {
      _sortPersons.addAll(_persons);
    }
    _sortPersons.sort((a,b) {
      return a.age!.compareTo(b.age as num);
    });
    personsUpdate.add(sort ? _sortPersons : _persons);
  }
}