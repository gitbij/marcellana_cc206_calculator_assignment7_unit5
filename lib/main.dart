import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int difference = 0;
  int product = 0;
  int quotient = 0;
  String operation = " ";
  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController minus1Controller = TextEditingController();
  TextEditingController minus2Controller = TextEditingController();
  TextEditingController multiply1Controller = TextEditingController();
  TextEditingController multiply2Controller = TextEditingController();
  TextEditingController divide1Controller = TextEditingController();
  TextEditingController divide2Controller = TextEditingController();
  // or store each value in the state
  int firstAddNum = 0;
  int secondAddNum = 0;
  int firstMinusNum = 0;
  int secondMinusNum = 0;
  int firstMultiplyNum = 0;
  int secondMultiplyNum = 0;
  int firstDivideNum = 0;
  int secondDivideNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.parse(value);
                    });
                  },
                ),
              ),
             
              Text(operation),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.parse(value);
                    });
                  },
                ),
              ),

              Text(' = $sum   '),
              
              // 3.a Add an IconButton here
              IconButton.outlined(
                icon: Icon(Icons.add),
                onPressed: () {
                    setState(() {
                      sum = firstAddNum + secondAddNum;
                      operation = " + ";
                    });
                } 
              ),

              // b.b Add an button here
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                    setState(() {
                      add1Controller.clear();
                      add2Controller.clear();
                      sum = 0;
                    });
                }, 
                child: Text("Clear Contents"),
              ),              
            ],
          ),

          // 3.c - Add the other operations
          // Minus Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: minus1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstMinusNum = int.parse(value);
                    });
                  },
                ),
              ),
             
              Text(operation),
              Expanded(
                child: TextField(
                  controller: minus2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondMinusNum = int.parse(value);
                    });
                  },
                ),
              ),

              Text(' = $difference   '),
              
              IconButton.outlined(
                icon: Icon(Icons.add),
                onPressed: () {
                    setState(() {
                      difference = firstMinusNum - secondMinusNum;
                      operation = " - ";
                    });
                } 
              ),

              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                    setState(() {
                      minus1Controller.clear();
                      minus2Controller.clear();
                      difference = 0;
                    });
                }, 
                child: Text("Clear Contents"),
              ),              
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: multiply1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstMultiplyNum = int.parse(value);
                    });
                  },
                ),
              ),
             
              Text(operation),
              Expanded(
                child: TextField(
                  controller: multiply2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondMultiplyNum = int.parse(value);
                    });
                  },
                ),
              ),

              Text(' = $product   '),
              
              IconButton.outlined(
                icon: Icon(Icons.add),
                onPressed: () {
                    setState(() {
                      product = firstMultiplyNum * secondMultiplyNum;
                      operation = " * ";
                    });
                } 
              ),

              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                    setState(() {
                      multiply1Controller.clear();
                      multiply2Controller.clear();
                      product = 0;
                    });
                }, 
                child: Text("Clear Contents"),
              ),              
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: divide1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstDivideNum = int.parse(value);
                    });
                  },
                ),
              ),
             
              Text(operation),
              Expanded(
                child: TextField(
                  controller: divide2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondDivideNum = int.parse(value);
                    });
                  },
                ),
              ),

              Text(' = $quotient   '),
              
          
              IconButton.outlined(
                icon: Icon(Icons.add),
                onPressed: () {
                    setState(() {
                      quotient = firstDivideNum ~/ secondDivideNum;
                      operation = " / ";
                    });
                } 
              ),

        
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                    setState(() {
                      divide1Controller.clear();
                      divide2Controller.clear();
                      quotient = 0;
                    });
                }, 
                child: Text("Clear Contents"),
              ),              
            ],
          ),

        ],
      ),
    );
  }
}