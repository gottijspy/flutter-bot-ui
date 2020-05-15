import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechBloc extends ChangeNotifier {
  SpeechRecognition _speechRecognition;

  bool _isRecogAvialable;
  bool _isListening;
  String _speechPrediction;

  bool get isRecogAvialable => _isRecogAvialable;
  set isRecogAvialable(bool value) {
    _isRecogAvialable = value;
    notifyListeners();
  }

  bool get isListening => _isListening;
  set isListening(bool value) {
    _isListening = value;
    notifyListeners();
  }

  String get speechPrediction => _speechPrediction;
  set speechPrediction(String value) {
    _speechPrediction = value;
    notifyListeners();
  }

  SpeechBloc() {
    _speechRecognition = SpeechRecognition();
    _isRecogAvialable = false;
    _isListening = false;
    _speechPrediction = '';

    _speechRecognition.setAvailabilityHandler(
      (bool result) => isRecogAvialable = result,
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => isListening = true,
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => speechPrediction = speech,
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => isListening = false,
    );

    _speechRecognition.activate().then(
          (result) => isRecogAvialable = result,
        );
  }

  startListening() {
    speechPrediction = '';
    _speechRecognition.listen(locale: "en_US");
  }

  stopListening() {
    _speechRecognition.stop().then((result) => isListening = result);
  }
}
