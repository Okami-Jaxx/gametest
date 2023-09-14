import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String random_number() {
  var rng = new Random();
  String num = rng.nextInt(100).toString();
  return num;
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldController = TextEditingController();
  String _result = "เดาตัวเลข";
  String _answer = random_number();
  int _i =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textFieldController,
              ),
              Text('$_result', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                if (_i<=5){
                  _i++;
                  if (_answer == textFieldController.text) {
                  _result = "สุดยอด! ถั่วต้ม";
                } else {
                  _result = "ยังมะถูกคำตอบคือ:" + _answer;
                }
                }
                

              },
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
