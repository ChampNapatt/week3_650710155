import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  const TrafficLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Light',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TrafficLightPage(),
    );
  }
}

class TrafficLightPage extends StatefulWidget {
  const TrafficLightPage({super.key});

  @override
  State<TrafficLightPage> createState() => _TrafficLightPageState();
}

class _TrafficLightPageState extends State<TrafficLightPage> {
  int _currentLight = 0; // 0 = Red, 1 = Yellow, 2 = Green
  int _timeLeft = 15; // Countdown timer
  Timer? _timer;

  final Map<int, int> _lightDurations = {
    0: 15, // Red
    1: 5, // Yellow
    2: 10, // Green
  };

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timeLeft = _lightDurations[_currentLight]!;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _changeLight();
        }
      });
    });
  }

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3; // Cycle through 0, 1, 2
      _timeLeft = _lightDurations[_currentLight]!;
    });
  }

  Color _getLightColor(int lightIndex) {
    switch (lightIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Traffic Light')),
    backgroundColor: Colors.grey,  
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_buildLight(0), _buildLight(1), _buildLight(2)],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Time Left: $_timeLeft s',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeLight,
            child: const Text('Change Light'),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildLight(int lightIndex) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: _currentLight == lightIndex ? _getLightColor(lightIndex) : Colors.white,  
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 2),  
    ),
  );
}

}