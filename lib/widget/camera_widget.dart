import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:lingua_expense/apis/translation_api.dart';
import 'package:lingua_expense/Provider/state_data.dart';
import 'package:provider/provider.dart';

import '../apis/recognition_api.dart';

class CameraWidget extends StatefulWidget {
  final CameraDescription camera;

  const CameraWidget({required this.camera, Key? key}) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> with ChangeNotifier{
  late CameraController cameraController;
  late Future<void> initCameraFn;
  String? shownText;
  @override
  void initState() {
    super.initState();
    cameraController = CameraController(widget.camera, ResolutionPreset.max);
    initCameraFn = cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        FutureBuilder(
          future: initCameraFn,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(cameraController),
            );
          },
        ),
        Positioned(
          bottom: 50,
          child: FloatingActionButton(
            onPressed: () async {
              final image = await cameraController.takePicture();
              final recognizedText = await RecognitionApi.recognizeText(
                  InputImage.fromFile(File(image.path)));
              if (recognizedText == null) return;
              Provider.of<StateData>(context, listen: false).changeRecognizedText(recognizedText);
              final translatedText = await TranslationApi.translateText(recognizedText);
              Provider.of<StateData>(context, listen: false).changeTranslatedText(translatedText!);
              setState(() {
                shownText = translatedText;
              });
            },
            child: const Icon(Icons.translate),
          ),
        ),
        if (shownText != null)
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.black45,
              child: Text(
                shownText!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Positioned(
          top: 50,
          left: 16,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );

  }
}
