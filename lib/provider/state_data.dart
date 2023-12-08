import 'package:flutter/material.dart';

class StateData with ChangeNotifier {
  String recognizedText = '-----';
  String translatedText = 'Translated text';
  changeRecognizedText(String text) {
    recognizedText = text;
  }

  changeTranslatedText(String text) {
    translatedText = text;
  }
}
