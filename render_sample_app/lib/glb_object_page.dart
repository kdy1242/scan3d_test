import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class GlbObjectPage extends StatelessWidget {
  const GlbObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Flutter3DController controller = Flutter3DController();

    return Flutter3DViewer(
      activeGestureInterceptor: true,
      progressBarColor: Colors.orange,
      enableTouch: true,
      onProgress: (double progressValue) {
        debugPrint('model loading progress : $progressValue');
      },
      onLoad: (String modelAddress) {
        debugPrint('model loaded : $modelAddress');
      },
      onError: (String error) {
        debugPrint('model failed to load : $error');
      },
      controller: controller,
      src: 'assets/chicken.glb',
    );
  }
}
