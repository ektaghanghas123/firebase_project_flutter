import 'package:flutter/material.dart';
import 'package:tryfor/CustomWidgets/styled_text.dart';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }


}

class LoginState extends State<LogIn>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText(text: "LogIn"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

      ),

    );
  }


}