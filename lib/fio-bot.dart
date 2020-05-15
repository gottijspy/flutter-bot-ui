import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbotui/blocs/chat_history_bloc.dart';
import 'package:flutterbotui/blocs/speech_bloc.dart';
import 'package:flutterbotui/login.dart';
import 'package:provider/provider.dart';

class FioBot extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatHistoryBloc()),
          ChangeNotifierProvider(create: (_) => SpeechBloc())
        ],
        child: MaterialApp(
          title: 'FIO Bot Demo - Virtual HR Assistant',
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.green,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
          //home: CounterPage(title: 'FIO Labs'),
          debugShowCheckedModeBanner: false,
        ));
  }
}
