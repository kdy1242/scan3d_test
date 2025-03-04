import 'package:flutter/material.dart';
import 'package:render_sample_app/glb_object_page.dart';
import 'package:render_sample_app/ply_object_page.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void goToGlbObjectPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GlbObjectPage()),
      );
    }

    void goToPlyObjectPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlyObjectPage()),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: goToGlbObjectPage,
              child: const Text('glb object'),
            ),
            ElevatedButton(
              onPressed: goToPlyObjectPage,
              child: const Text('ply object'),
            ),
          ],
        ),
      ),
    );
  }
}
