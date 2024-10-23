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
  String operation = " ";
  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  // or store each value in the state
  int firstAddNum = 0;
  int secondAddNum = 0;
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
          Row (
          children: [
            IconButton.outlined(
                
                icon: Icon(Icons.remove),
                onPressed: () {
                    setState(() {
                      sum = firstAddNum - secondAddNum;
                      operation = " - ";
                    });
                } 
              ),            
          ] 
          ),
          // Multiplication Row
          Row (
          children: [
            IconButton.outlined(
                
                icon: Icon(Icons.clear),
                onPressed: () {
                    setState(() {
                      sum = firstAddNum * secondAddNum;
                      operation = " * ";
                    });
                } 
              ),            
          ] 
          ),
          // Division Row
           Row (
          children: [
            IconButton.outlined(
                //sir yawan ko ngita divide na icon :'>
                icon: Icon(Icons.safety_divider),
                onPressed: () {
                    setState(() {
                      sum = firstAddNum ~/ secondAddNum;
                      operation = " / ";
                    });
                } 
              ),            
          ] 
          ),
        ],
      ),
    );
  }
}