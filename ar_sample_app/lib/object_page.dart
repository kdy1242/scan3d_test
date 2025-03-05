// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart';

// class ObjectPage extends StatefulWidget {
//   const ObjectPage({super.key});

//   @override
//   State<ObjectPage> createState() => _ObjectPageState();
// }

// class _ObjectPageState extends State<ObjectPage> {
//   late ARSessionManager arSessionManager;
//   late ARObjectManager arObjectManager;
//   ARNode? localObjectNode;
//   ARNode? webObjectNode;
//   bool isAdd = false;

//   final sample =
//       "https://github.com/KhronosGroup/glTF-Sample-Models/blob/main/2.0/Duck/glTF-Binary/Duck.glb?raw=true";

//   final sample2 = "assets/chicken.glb";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ARView(onARViewCreated: onARViewCreated),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addNode,
//         child: Icon(isAdd ? Icons.remove : Icons.add),
//       ),
//     );
//   }

//   void onARViewCreated(
//       ARSessionManager arSessionManager,
//       ARObjectManager arObjectManager,
//       ARAnchorManager arAnchorManager,
//       ARLocationManager arLocationManager) {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;

//     this.arSessionManager.onInitialize(
//           showFeaturePoints: false,
//           showPlanes: true,
//           customPlaneTexturePath: "assets/triangle.png",
//           showWorldOrigin: true,
//           handleTaps: false,
//         );

//     this.arObjectManager.onInitialize();
//   }

//   Future onWebObjectAtButtonPressed() async {
//     setState(() {
//       isAdd = !isAdd;
//     });

//     if (webObjectNode != null) {
//       arObjectManager.removeNode(webObjectNode!);
//       webObjectNode = null;
//     } else {
//       var newNode = ARNode(
//         type: NodeType.webGLB,
//         uri: sample,
//         scale: Vector3(0.2, 0.2, 0.2),
//       );
//       bool? didAddWebNode = await arObjectManager.addNode(newNode);
//       webObjectNode = (didAddWebNode!) ? newNode : null;
//     }
//   }

//   void addNode() {}

//   @override
//   void dispose() {
//     arSessionManager.dispose();
//     super.dispose();
//   }
// }
