import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';

class AddDataViewModel extends BaseViewModel {
  final _dio = Dio();
  UserModel? newUser;

  Future<UserModel?> addUser(
      String firstName, String lastName, String email) async {
    try {
      var res = await _dio.post('https://reqres.in/api/users', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email
      });

      if (res.statusCode == 201) {
        newUser = UserModel(
            id: int.tryParse(res.data['id']) ?? 0,
            firstName: res.data['first_name'],
            lastName: res.data['last_name'],
            email: res.data['email']);
      }
      return newUser;
    } catch (e) {
      // throw Exception(e.toString());
      return null;
    }
  }

  deleteUser() {
    newUser = null;
    notifyListeners();
  }
}
