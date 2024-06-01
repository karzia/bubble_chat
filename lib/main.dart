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
  final ChatPos pos;
  final Widget name;
  final Widget content;
  const ChatData(this.pos, this.name, this.content);
}

class _MyHomePageState extends State<MyHomePage> {
  static const String user="미카";
  static const String agent="챗챗 서비스";

  final testData = <ChatData>[
    ChatData(ChatPos.right, Text(user), Text("공부좀 도와줘?")),
    ChatData(ChatPos.left,Text(agent), Text("무슨 공부를 도와드릴까요?")),
    ChatData(ChatPos.right,Text(user), Text("수 학 공부")),
    ChatData(ChatPos.left,Text(agent), Column(children: [
      Text("10+10은?"),
      Icon(Icons.timer),
      ElevatedButton(child:Text("정답은 20 입니다."),onPressed: (){},),
    ])),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ㅋㅋㅋ 챗!!!챗")
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: testData.map((e)=>renderBubble(pos:e.pos, name: e.name, content:e.content,date: DateTime.now())).toList(),
        ),
      ),
    );
  }
}
