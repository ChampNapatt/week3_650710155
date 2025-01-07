import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';

class PortalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Answer')),
        backgroundColor: Colors.orange,
      ),
      body: Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnswerPage1()),
                );
              },
              child: Text('Answer1'),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnswerPage2()),
                );
              },
              child: Text('Answer2'),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnswerPage3()),
                );
              },
              child: Text('Answer3'),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnswerPage4()),
                );
              },
              child: Text('Answer4'),
            ),
          ],
        ),
      ),
    );
  }
}
