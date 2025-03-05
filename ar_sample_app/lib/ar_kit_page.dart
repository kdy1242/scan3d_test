import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArKitPage extends StatefulWidget {
  const ArKitPage({super.key});

  @override
  State<ArKitPage> createState() => _ArKitPageState();
}

class _ArKitPageState extends State<ArKitPage> {
  late ARKitController arkitController;
  final snapshots = [];

  void onARKitViewCreated(ARKitController controller) {
    arkitController = controller;
  }

  void addNode() async {
    final rotationVector = await arkitController.getCameraEulerAngles();
    final nodePosition = await getNodePosition();

    final box = ARKitBox(
      width: 0.05,
      height: 0.03,
      length: 0.002,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.blue),
          transparent: ARKitMaterialProperty.value(0.5),
        ),
      ],
    );

    final node = ARKitNode(
      geometry: box,
      eulerAngles: vector.Vector3(
        rotationVector.y,
        rotationVector.x,
        rotationVector.z,
      ),
      position: nodePosition,
    );

    arkitController.add(node);

    final imageProvider = await arkitController.getCapturedImage();

    setState(() {
      snapshots.add(imageProvider);
    });
  }

  Future<vector.Vector3?> getNodePosition() async {
    final Matrix4? cameraTransform =
        await arkitController.pointOfViewTransform();

    final vector.Vector3? cameraPosition =
        await arkitController.cameraPosition();

    if (cameraTransform == null || cameraPosition == null) return null;

    final vector.Vector3 backwardVector = applyCameraRotation(
      vector.Vector3(0, 0, 1),
      cameraTransform,
    );

    return cameraPosition - (backwardVector * 0.1);
  }

  vector.Vector3 applyCameraRotation(
    vector.Vector3 forward,
    Matrix4 cameraTransform,
  ) {
    final vectorX = forward.x * cameraTransform.entry(0, 0) +
        forward.y * cameraTransform.entry(0, 1) +
        forward.z * cameraTransform.entry(0, 2);

    final vectorY = forward.x * cameraTransform.entry(1, 0) +
        forward.y * cameraTransform.entry(1, 1) +
        forward.z * cameraTransform.entry(1, 2);

    final vectorZ = forward.x * cameraTransform.entry(2, 0) +
        forward.y * cameraTransform.entry(2, 1) +
        forward.z * cameraTransform.entry(2, 2);

    final vector.Vector3 transformedVector = vector.Vector3(
      vectorX,
      vectorY,
      vectorZ,
    );

    return transformedVector.normalized();
  }

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: ARKitSceneView(
              onARKitViewCreated: onARKitViewCreated,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: snapshots.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: snapshots[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNode,
        child: const Icon(Icons.add),
      ),
    );
  }
}
