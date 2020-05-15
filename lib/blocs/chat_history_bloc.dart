import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatMessage {
  String message;
  bool isAnswer;

  ChatMessage(String message, bool isAnswer) {
    this.message = message;
    this.isAnswer = isAnswer;
  }
}

class ChatHistoryBloc extends ChangeNotifier {
  List<ChatMessage> _chatHistory = [];
  List<ChatMessage> get chatHistory => _chatHistory;

  String _question = "";
  String get question => _question;

  String _answer = 'Sorry, I dont know that';
  String get answer => _answer;
  set answer(String answer) {
    _answer = answer;
    notifyListeners();
  }

  FlutterTts _flutterTts = FlutterTts();

  List<String> questions = [
    'hello i\'m finding it difficult to keep my kids engaged do you have any advice',
    'i\'m feeling quite distracted and unmotivated while working from home do you have any tips',
    'how are the company revenues will there be a pay cut',
    'will i lose my job',
    'will my paycheck come on time',
    'will i get an expense account to set up a home office',
    'can you suggest a lullaby to sing to my kid'
  ];

  List<String> answers = [
    "Working from home and taking care of your kids must be a challenging task, we understand. Why don’t you try an educational platform which helps is fun learning. Here are a few platforms, I think is good.\n\n TOP BEST ONLINE LEARNING TOOLS FOR KIDS IN 2020.\n\n 1. ABCmouse, \n 2. Reading Eggs, \n 3. PBS Kids, \n 4. BrainPOP, \n 5. National Geographic Kids, \n 6. Coolmath, \n\n Hope this helps you!",
    'That is quite common, don’t worry! Have you tried following a set routine? This can help you feel more motivated and active.\n\n Here are a few tips.\n\n•Have a dedicated workspace. \n• Dress for Success, trust me it will make you feel \rbetter!. \n• Create a work schedule - Allocated time for \rwork and personal chores. \n• Take a workout break. \n• Make sure you take breaks and enjoy them.\nI hope this helps!',
    'Well isn’t this something that makes us all quite nervous, you are not alone. As of now, there is nothing planned, *Company XYZ* has your best interest in mind.',
    'I know this is a scary time. Let me have an HR resource get in touch with you for a quick 1on 1.',
    'Mostly yes, under the given circumstances our payroll team is working hard to make sure of that.',
    'Great question! Let me have an HR resource get in touch with you for a quick one on one.',
    ' Sure not a problem!, Here is a list of my favorite lullaby, \n\n 1. Kumbaya, \n 2. Baa Baa Black Sheep, \n 3. Swing Low Sweet Chariot, \n 4. Twinkle Twinkle Little Star, \n 5. Hush Little Baby (Traditional) / (We are big fans of Hush Little Digger, too.) \n\n I hope your child enjoys it!',
  ];

  addWelcomeText(String welcomeText) {
    answer = welcomeText;
    speak(answer);
    _chatHistory.add(new ChatMessage(answer, true));
  }

  addQuestion(String question) {
    _chatHistory.add(new ChatMessage(question, false));

    var index = questions.indexOf(question.toLowerCase());
    if (index == -1) {
      answer = 'Sorry, I dont know that';
    } else {
      answer = answers[index];
    }

    speak(answer);
    _chatHistory.add(new ChatMessage(answer, true));
  }

  Future speak(resultText) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1);
    await _flutterTts.speak(resultText);
  }

  Future stop() async {
    await _flutterTts.stop();
  }
}
