import 'package:flutter/material.dart';

void main() {
  runApp(const AnswerPage2());
}

class AnswerPage2 extends StatelessWidget {
  const AnswerPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Social Media Post')),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // แถวแรก: โปรไฟล์และชื่อผู้ใช้
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // รูปโปรไฟล์
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // ชื่อผู้ใช้และเวลาโพสต์
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '5 minutes ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // แถวที่สอง: รูปภาพโพสต์
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              // แถวที่สาม: ปุ่ม Like, Comment, Share
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Like'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Comment'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Share'),
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
