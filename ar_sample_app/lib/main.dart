import 'package:ar_sample_app/object_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void goToARView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ObjectPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: goToARView,
          child: const Text('go'),
        ),
      ),
    );
  }
}
