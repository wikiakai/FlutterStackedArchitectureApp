import 'package:app_networking/ui/views/add_data/add_data_view.dart';
import 'package:app_networking/ui/views/detail/detail_view.dart';
import 'package:app_networking/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking with Stacked'),
      ),
      body: viewModel.isloading
          ? const Center(child: CircularProgressIndicator(color: Colors.cyan))
          : viewModel.users.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: viewModel.users.length,
                  itemBuilder: (context, index) {
                    final user = viewModel.users[index];
                    return ListTile(
                      tileColor: const Color(0xff264653),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailView(user)));
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
                )
              : const Center(child: Text('Please Hit the button')),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
                onPressed: viewModel.getUsers,
                icon: const Icon(Icons.home),
                label: const Text('Home')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddDataView()));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add data')),
          ],
        )
        // FooterButton(
        //   onTap: getUsers,
        // )
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
