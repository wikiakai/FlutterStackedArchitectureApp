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
    return const Scaffold();
  }
}
