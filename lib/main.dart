import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  String? kq;
  void tinhtong() {
    double nb1 = double.parse(number1.text.trim());
    double nb2 = double.parse(number2.text.trim());
    double num = nb1 + nb2;

    print(nb1);
    print(nb2);
    setState(() {
      kq = "Tổng: $num";
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResultSceen(kq!)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: InputDecoration(
                labelText: "Nhập Số 1", border: OutlineInputBorder()),
            controller: number1,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Nhập Số 2", border: OutlineInputBorder()),
            controller: number2,
          ),
          ElevatedButton(
              onPressed: () {
                tinhtong();
              },
              child: Text("Tính tổng"))
        ])),
      ),
    );
  }
}

class ResultSceen extends StatelessWidget {
  final String result;
  ResultSceen(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kết quả tính tổng")),
      body: Center(
        child: Text(
          result,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
