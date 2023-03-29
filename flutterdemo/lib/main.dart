import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/pigeon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // static const platform = MethodChannel('samples.flutter.dev/memory');
  double _memoryUsage = 0.0;

  @override
  void initState() {
    super.initState();
    _getMemoryUsage();
  }

  Future<void> _getMemoryUsage() async {
    try {
      final memoryUsage = await MemoryApi().getMemoryInfo();
      setState(() {
        _memoryUsage = memoryUsage.usedMemory ?? 0;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to get memory usage: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Memory Usage'),
        ),
        body: Center(
          child: Text('Memory usage: $_memoryUsage%'),
        ),
      ),
    );
  }
}
