import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';
import 'detail_viewmodel.dart';

class DetailView extends ViewModelBuilderWidget<DetailViewModel> {
  final UserModel user;

  const DetailView(this.user, {Key? key}) : super(key: key);

  @override
  viewModelBuilder(BuildContext context) => DetailViewModel(user);

  @override
  Widget builder(
      BuildContext context, DetailViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 500,
            child: Card(
              color: const Color(0xffa8dadc),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network('${user.avatar}'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text('${user.email}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
