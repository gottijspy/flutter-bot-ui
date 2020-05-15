import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbotui/blocs/chat_history_bloc.dart';
import 'package:flutterbotui/blocs/speech_bloc.dart';
import 'package:provider/provider.dart';

class ChatHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChatHistoryBloc chatHistoryBloc =
        Provider.of<ChatHistoryBloc>(context);

    ScrollController scrollController = ScrollController();
    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: chatHistoryBloc.chatHistory.length,
        itemBuilder: (context, index) {
          print('-------->');
          print('$index');
          bool isAnswer = chatHistoryBloc.chatHistory[index].isAnswer;

          return Container(
            margin: EdgeInsets.all(5),
            padding: isAnswer == false
                ? EdgeInsets.only(left: 40)
                : EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  mainAxisAlignment: isAnswer == false
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: isAnswer == false
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: isAnswer == false
                            ? LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                    0.1,
                                    1
                                  ],
                                colors: [
                                    Colors.blueGrey[100],
                                    Colors.blueGrey[100]
                                    //Color(0xFFEBF5FC),
                                    //Color(0xFFEBF5FC),
                                  ])
                            : LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                    0.1,
                                    1
                                  ],
                                colors: [
                                    Colors.green[100],
                                    Colors.green[100]
                                    //Color(0xFFF6D365),
                                    //Color(0xFFFDA085),
                                  ]),
                        borderRadius: isAnswer == false
                            ? BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(15),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(0),
                              ),
                      ),
                      child: Column(
                        crossAxisAlignment: isAnswer
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            chatHistoryBloc.chatHistory[index].message,
                            textAlign: isAnswer == false
                                ? TextAlign.end
                                : TextAlign.start,
                            style: TextStyle(
                              color: isAnswer == false
                                  ? Colors.black87
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
