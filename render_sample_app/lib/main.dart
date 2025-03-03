import 'package:flutter/material.dart';
import 'package:render_sample_app/object_page.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ObjectPage()),
            );
          },
          child: const Text('test'),
        ),
      ),
    );
  }
}
