import 'package:app_networking/services/user_model.dart';
import 'package:flutter/material.dart';
import '../widgets/footer_button.dart';
import 'user_list_view.dart';
import '../services/users_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isloading = false;
  final _userApi = UserApi();
  List<UserModel> _users = [];

  Future _getUsers() async {
    setState(() {
      _isloading = true;
    });

    _users = await _userApi.getUsers();

    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isloading
          ? const Center(child: CircularProgressIndicator(color: Colors.cyan))
          : _users.isNotEmpty
              ? UsersListView(users: _users)
              : const Center(
                  child: Text('Please hit the home button',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold))),
      persistentFooterButtons: [
        FooterButton(
          onTap: _getUsers,
        )
      ],
    );
  }
}
