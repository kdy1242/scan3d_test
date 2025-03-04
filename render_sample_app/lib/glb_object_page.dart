import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class GlbObjectPage extends StatelessWidget {
  const GlbObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Flutter3DController controller = Flutter3DController();

    return Scaffold(
      appBar: AppBar(),
      body: Flutter3DViewer(
        controller: controller,
        src: 'assets/chicken.glb',
      ),
    );
  }
}
