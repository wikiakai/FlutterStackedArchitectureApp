import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';
import 'add_data_viewmodel.dart';

class AddDataView extends ViewModelBuilderWidget<AddDataViewModel> {
  AddDataView({Key? key}) : super(key: key);

  @override
  viewModelBuilder(BuildContext context) => AddDataViewModel();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget builder(
      BuildContext context, AddDataViewModel viewModel, Widget? child) {
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
                        onPressed: () => viewModel.addUser(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text),
                        icon: const Icon(Icons.send_outlined),
                        label: const Text('Send Data'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff264653)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => viewModel.addUser(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text),
                        icon: const Icon(Icons.update),
                        label: const Text('Update Data'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff2a9d8f)),
                      ),
                      ElevatedButton.icon(
                        onPressed: viewModel.deleteUser,
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
                      if (viewModel.newUser != null)
                        Card(
                          color: const Color(0xffe63946),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  '${viewModel.newUser?.firstName}',
                                  style: const TextStyle(
                                      color: Color(0xffffc300),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('${viewModel.newUser?.lastName}',
                                    style: const TextStyle(
                                        color: Color(0xffffc300),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                Text('${viewModel.newUser?.email}',
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
