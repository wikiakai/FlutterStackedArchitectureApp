import 'package:flutter/material.dart';
import '../services/user_model.dart';
import '../services/users_api.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _addUsers = UserApi();
  UserModel? _newUsers;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Data'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Column(
                      children: [
                        TextField(
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            label: Text(
                              'Insert first name',
                              style: TextStyle(color: Color(0xff264653)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: lastNameController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            label: Text('Insert last name',
                                style: TextStyle(color: Color(0xff264653))),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            label: Text('Insert email',
                                style: TextStyle(color: Color(0xff264653))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          // UserModel? result = await _addUsers.addUsers(
                          //   firstNameController.text,
                          //   lastNameController.text,
                          //   emailController.text,
                          // );

                          // if (result != null) {
                          //   setState(() {
                          //     _newUsers = result;
                          //   });
                          // }
                        },
                        icon: const Icon(Icons.send_outlined),
                        label: const Text('Send Data'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff264653)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          // UserModel? result = await _addUsers.addUsers(
                          //   firstNameController.text,
                          //   lastNameController.text,
                          //   emailController.text,
                          // );
                          // if (result != null) {
                          //   setState(() {
                          //     _newUsers = result;
                          //   });
                          // }
                        },
                        icon: const Icon(Icons.update),
                        label: const Text('Update Data'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff2a9d8f)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _newUsers = null;
                          });
                        },
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Delete Data'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffe76f51)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (_newUsers != null)
                        Card(
                          color: const Color(0xffe63946),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  '${_newUsers?.firstName}',
                                  style: const TextStyle(
                                      color: Color(0xffffc300),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('${_newUsers?.lastName}',
                                    style: const TextStyle(
                                        color: Color(0xffffc300),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                Text('${_newUsers?.email}',
                                    style: const TextStyle(
                                        color: Color(0xffffc300),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
