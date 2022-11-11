import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _height = TextEditingController();
  final _weight = TextEditingController();
  double? res;
  String msg = '';

  void calculate() {
    double h = double.parse(_height.text) / 100;
    double w = double.parse(_weight.text);
    double heightsquare = h * h;
    double result = w / heightsquare;
    setState(() {
      res = result;
    });
    if (res! < 18.5) {
      msg = "You are underweight";
    } else if (res! >= 18.5 && res! < 24.9)
      msg = "You are Fine";
    else if (res! >= 24.9 && res! < 30)
      msg = "You are overweight";
    else if (res! >= 30) msg = "You are Suffering from Obesity";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.blue.shade500,
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _height,
                  decoration: const InputDecoration(
                    // hoverColor: Colors.yellow,
                    hintText: 'Enter Your Height',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              // ignore: prefer_const_constructors
              // SizedBox(
              //   height: 2,
              // ),
              Container(
                // color: Colors.blue.shade500,
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _weight,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Weight',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 6,
              ),
              ElevatedButton(
                onPressed: calculate,
                child: const Text('Submit'),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Visibility(
                  // ignore: unnecessary_brace_in_string_interps
                  child: Text(
                res == null ? '' : 'BMI: ${res!.toStringAsFixed(2)}, ${msg}',
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
