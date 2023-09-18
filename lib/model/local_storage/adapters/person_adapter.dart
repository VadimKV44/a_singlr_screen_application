import 'package:a_single_screen_application/model/models/person_model.dart';
import 'package:hive/hive.dart';

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final typeId = 0;

  @override
  Person read(BinaryReader reader) {
    final String id = reader.readString();
    final String name = reader.readString();
    final String surname = reader.readString();
    final int age = reader.readInt();
    final String gender = reader.readString();
    return Person(id: id, name: name, surname: surname, age: age, gender: gender);
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.surname ?? '');
    writer.writeInt(obj.age ?? 0);
    writer.writeString(obj.gender ?? '');
  }
}
