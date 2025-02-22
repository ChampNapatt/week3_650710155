import 'product/product_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '650710155',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 130, 240),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247), // สีฟ้าอ่อน
        useMaterial3: true,
      ),
      home: const ProductMainPage(),
    );
  }
}
