import 'package:ar_sample_app/ar_core_page.dart';
import 'package:ar_sample_app/ar_kit_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void goToARKitPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ArKitPage()),
    );
  }

  void goToARCorePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ArCorePage()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: goToARKitPage,
              child: const Text('ARKit (iOS)'),
            ),
            ElevatedButton(
              onPressed: goToARCorePage,
              child: const Text('ARCore (Android)'),
            ),
          ],
        ),
      ),
    );
  }
}
