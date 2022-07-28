import 'package:stacked/stacked.dart';
import '../../../models/user_model.dart';
import '../../../services/users_api.dart';

class HomeViewModel extends BaseViewModel {
  bool isloading = false;
  final userApi = UserApi();

  List<UserModel> users = [];

  void getUsers() async {
    isloading = true;
    notifyListeners();
    users = await userApi.getUsers();

    isloading = false;
    notifyListeners();
  }
}
