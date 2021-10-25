import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

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
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: inputController,
          decoration:
              const InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
        ),
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
        Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                _result.toStringAsFixed(1),
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: perhitunganSuhu,
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: const Text("Konversi Suhu"),
          ),
        ),
      ],
    );
  }
}
