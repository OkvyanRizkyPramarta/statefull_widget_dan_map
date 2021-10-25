import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Result.dart';
import 'RiwayatKonversi.dart';
import 'Input.dart';
import 'Convert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Konverter Suhu';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final double _kelvin = 0;
  final double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  double _inputUser = 0;

  List<String> listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = <String>[];

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Input(inputController: inputController),
          Container(
            margin: const EdgeInsets.all(15),
            child: DropdownButton<String>(
              items: listItem.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _newValue,
              onChanged: (changeValue) {
                setState(() {
                  _newValue = changeValue!;
                  perhitunganSuhu();
                });
              },
            ),
          ),
          Result(result: _result),
          Convert(konvertHandler: perhitunganSuhu),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
          ),
          RiwayatKonversi(listViewItem: listViewItem),
        ],
      ),
    );
  }
}
