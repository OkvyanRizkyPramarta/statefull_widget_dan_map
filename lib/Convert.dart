// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    required this.konvertHandler,
  }) : super(key: key);
  final konvertHandler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: const Text("Konversi Suhu"),
      ),
    );
  }
}
