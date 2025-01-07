import 'package:flutter/material.dart';

void main() {
  runApp(const AnswerPage1());
}

class AnswerPage1 extends StatelessWidget {
  const AnswerPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Grid Layout')),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}