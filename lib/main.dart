import 'package:flutter/material.dart';

import 'bubble_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ChatData{
  final ChatUser user;
  final Widget w;
  const ChatData(this.user, this.w);
}

class _MyHomePageState extends State<MyHomePage> {

  final testData = <ChatData>[
    ChatData(ChatUser.me,Text("내이름 뭐게?")),
    ChatData(ChatUser.agent,ElevatedButton(child: Text("나도 몰라"),onPressed: (){},)),
    ChatData(ChatUser.me,Text("내이름 뭐게?")),
    ChatData(ChatUser.agent,Column(children: [
      Text("일번"),
      Icon(Icons.account_balance),
      ElevatedButton(child:Text("삼번"),onPressed: (){},),
    ])),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ㅋㅋㅋ 챗!!!챗")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: testData.map((e)=>renderBubble(user:e.user, widget:e.w)).toList(),
        ),
      ),
    );
  }
}
