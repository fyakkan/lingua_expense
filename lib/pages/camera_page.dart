import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../widget/camera_widget.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 16, // Adjust the position as needed
            right: 16, // Adjust the position as needed
            child: FloatingActionButton(onPressed: () {
              Navigator.pop(context);
            }),
          ),
          FutureBuilder<List<CameraDescription>>(
            future: availableCameras(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError || !snapshot.hasData) {
                print(snapshot.error);
                return const Center(
                  child: Text("Error"),
                );
              }
              final cameras = snapshot.data!;
              // You might want to select a camera from the cameras list here
              // For instance, choose the first camera
              final selectedCamera = cameras.first;
              return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: CameraWidget(camera: selectedCamera));
            },
          ),
        ],
      ),
    );
  }
}
