import 'package:flutter/material.dart';

import '../services/user_model.dart';
import 'detail_page.dart';
import '../services/user_model.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({
    Key? key,
    required List<UserModel> users,
  })  : _users = users,
        super(key: key);

  final List<UserModel> _users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];
        return ListTile(
          tileColor: const Color(0xff264653),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(user)));
          },
          leading: ClipOval(
            child: Image.network(
              '${user.avatar}',
              // error handling for image
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${user.email}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
