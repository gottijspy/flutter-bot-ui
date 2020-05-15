import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterbotui/blocs/speech_bloc.dart';
import 'package:flutterbotui/widgets/ask_question.dart';
import 'package:flutterbotui/widgets/chat_history.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(Object context) {
    final SpeechBloc speechBloc = Provider.of<SpeechBloc>(context);

    const listeningAnimation = SpinKitThreeBounce(
      color: Colors.pinkAccent,
      size: 20.0,
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("FIO Bot - Virtual HR Assistant")),
      // body: Container(
      //   margin: EdgeInsets.only(bottom: 30),
      //   child:
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.volume_up),
            //   color: Colors.pink,
            //   onPressed: () {},
            // ),
            //Text(answerBloc.answer),
            ChatHistory(),
            Divider(
              color: Colors.blueGrey,
            ),
            AskQuestion(),
            speechBloc.isListening ? listeningAnimation : Text(''),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.mic,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          speechBloc.isListening
              ? speechBloc.stopListening()
              : speechBloc.startListening();
          // } else {

          // }

          // speechBloc.isListening = !speechBloc.isListening;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10))
            // IconButton(
            //   icon: Icon(Icons.volume_up),
            //   color: Colors.white,
            //   onPressed: () {},
            // ),
            //textInput,
          ],
        ),
        color: Colors.green,
      ),
    );
  }
}
