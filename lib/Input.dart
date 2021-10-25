// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    required this.inputController,
  }) : super(key: key);
  TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: inputController,
          decoration:
              const InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
        ),
      ],
    );
  }
}
