

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ChatUser{
  me("user"),
  agent("assistant")
  ;

  final String name;
  const ChatUser(this.name);
}
extension ChatUserExt on String{
  get toUser {
    if( this== "user" || this== "me") return ChatUser.me;
    return ChatUser.agent;
  }
}

W(double v) => 1*v;
extension Iext on int{
  double get wr => toDouble();
  double get hr => toDouble();
}


Widget renderBubble({required ChatUser user, required Widget widget, DateTime? date,}) {



  return Container(
    alignment: (user == ChatUser.agent) ? Alignment.centerLeft : Alignment.centerRight,
    child: Container(
      constraints: BoxConstraints(maxWidth: W(200)),
      padding: EdgeInsets.all(W(10)),
      margin: EdgeInsets.only(top: W(5), bottom: 5.wr),
      decoration: BoxDecoration(
          color:
          (user == ChatUser.me) ? Colors.amberAccent.withOpacity(0.5) : Colors.lightBlueAccent.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: (user == ChatUser.agent) ? Radius.zero : const Radius.circular(20),
            topRight: (user == ChatUser.me) ? Radius.zero : const Radius.circular(20),
            bottomLeft: Radius.circular(20.wr),
            bottomRight: Radius.circular(20.wr),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: (user == ChatUser.agent) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if(date!=null)
            Text(
              DateFormat("MM월dd일 HH:mm").format(date),
              style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              textAlign: (user == ChatUser.agent) ? TextAlign.left : TextAlign.right,
            ),
          widget
          
        ],
      ),
    ),
  );
}