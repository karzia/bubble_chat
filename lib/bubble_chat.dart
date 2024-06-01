

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ChatPos{
  left,
  right,
}



Widget renderBubble({required ChatPos pos, Widget? name, Widget? content, DateTime? date,}) {

  return Container(
    alignment: (pos == ChatPos.right) ? Alignment.centerRight:Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: (pos == ChatPos.right) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if(date!=null)
          Text(
            DateFormat("MM월dd일 HH:mm").format(date),
            style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            textAlign: (pos == ChatPos.right) ?  TextAlign.right:TextAlign.left,
          ),
        if(name!=null)name,
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              color:
              (pos == ChatPos.right) ? Colors.amberAccent.withOpacity(0.5) : Colors.lightBlueAccent.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topLeft: (pos == ChatPos.left)  ? Radius.zero : const Radius.circular(20),
                topRight: (pos == ChatPos.right)  ? Radius.zero : const Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: (pos == ChatPos.right) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [


              if(content!=null) content else Container(),
            ],
          ),
        ),
      ],
    ),
  );
}