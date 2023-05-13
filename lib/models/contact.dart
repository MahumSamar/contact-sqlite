import 'base_model.dart';

class Contact extends BaseModel {
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _phone;

  Contact(this._firstName, this._lastName, this._email, this._phone);
  Contact.map(dynamic obj) {
    setId(obj["id"]);
    this._firstName = obj['firstName'];
    this._lastName = obj['lastName'];
    this._email = obj['email'].toString();
    this._phone = obj['phone'].toString();
  }
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phone => _phone;

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'firstName': _firstName,
      'lastName': _lastName,
      'email': _email,
      'phone': _phone
    };

    return map;
  }
}
