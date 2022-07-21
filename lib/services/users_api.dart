import 'package:app_networking/services/user_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class UserApi {
  final List<UserModel> users = []; //variabel kosong untuk menampung list
  final _dio = Dio();

  getUsers() async {
    // setState(() => _isloading = true);

    try {
      var res = await _dio.get('https://reqres.in/api/users?page=1');

      users.clear();
      // mengambil data dan di map di modelmenjadi list
      users.addAll(List<UserModel>.from(
          res.data['data'].map((i) => UserModel.fromJson(i))));

      return users;
    } catch (e) {
      developer.log(e.toString());
      // setState(() => _isloading = false);
    }
  }

  Future<UserModel?> addUsers(
    String firstName,
    String lastName,
    String email,
  ) async {
    try {
      var res = await _dio.post('https://reqres.in/api/users', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email
      });
      if (res.statusCode == 201) {
        return UserModel(
            id: int.tryParse(res.data['id']) ?? 0,
            firstName: res.data['first_name'],
            lastName: res.data['last_name'],
            email: res.data['email'],
            avatar: res.data['avatar']);
      }
    } catch (e) {
      // throw Exception(e.toString());
      return null;
    }
  }
}
