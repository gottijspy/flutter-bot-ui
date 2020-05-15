import 'package:flutter/material.dart';
import 'package:flutterbotui/blocs/chat_history_bloc.dart';
import 'package:flutterbotui/blocs/speech_bloc.dart';
import 'package:provider/provider.dart';

class AskQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChatHistoryBloc chatHistoryBloc =
        Provider.of<ChatHistoryBloc>(context);

    final SpeechBloc speechBloc = Provider.of<SpeechBloc>(context);
    TextEditingController _questionField =
        TextEditingController(text: speechBloc.speechPrediction);

    return Container(
        //color: Colors.purpleAccent[300],
        //padding: EdgeInsets.symmetric(vertical: 10),
        //margin: EdgeInsets.only(bottom: 40),
        child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: _questionField,
              style: TextStyle(
                color: Colors.black87,
                decorationColor: Colors.black87,
              ),
              onChanged: (text) {
                // setState(() {
                //   enableButton = _isAvailable && !_isListening;
                // });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Talk to FIO...",
                  hoverColor: Colors.black87,
                  hintStyle: TextStyle(color: Colors.black87)),
              cursorColor: Colors.black87,
            ),
          ),
        ),
        //_textEditingController.text.isNotEmpty
        //?
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.send,
          ),
          disabledColor: Colors.grey,
          onPressed: () {
            if (_questionField.text != '') {
              var question = _questionField.text;
              speechBloc.speechPrediction = '';
              speechBloc.stopListening();
              chatHistoryBloc.addQuestion(question);
            }
          },
        ),
      ],
    ));
  }
}
