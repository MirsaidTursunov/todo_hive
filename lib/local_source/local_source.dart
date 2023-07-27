import 'package:hive/hive.dart';
import 'package:todo_hive/constants/app_keys.dart';

class LocalSource {

  LocalSource(this.box);
  final Box<dynamic> box;

  

  void clear() {
    box.clear();
  }


  Future<void> setPhoneNumber(String phoneNumber) async {
    await box.put(AppKeys.phoneNumber, phoneNumber);
  }

  void deletePhoneNumber() {
    box.delete(AppKeys.phoneNumber);
  }

  String get phoneNumber => box.get(AppKeys.phoneNumber, defaultValue: '');

}
