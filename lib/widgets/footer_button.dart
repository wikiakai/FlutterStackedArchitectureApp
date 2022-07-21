import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/add_data.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.home),
            label: const Text('Home')),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddData()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add data')),
      ],
    );
  }
}
