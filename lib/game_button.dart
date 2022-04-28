
import 'dart:ui';
import 'package:flutter/material.dart';
class gameButton{
  int id;
  String text;
  Color bg;
  bool enabled;
  gameButton({this.id =0,
    this.text="",
    this.bg=Colors.greenAccent,
    this.enabled=true,
  });
}

  //using round brackets mean that these variables are required to hold value!!
//square brackets for action Text means it is not required by the object of class

class customDialog extends StatelessWidget {
  final title;
  final content;
  final actionText;
  final VoidCallback callback;
  customDialog(this.title,this.content,this.callback,[this.actionText="Reset"]) ;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(onPressed: callback, child: Text(actionText))
      ],
    );
  }
}
