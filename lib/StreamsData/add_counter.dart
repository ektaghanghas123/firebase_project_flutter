import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tryfor/InheritedWidget/counter_notifier.dart';

import '../CustomWidgets/custom_text_edit.dart';
import '../CustomWidgets/styled_text.dart';

class AddCounter extends StatefulWidget{
  const AddCounter({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCounterState();
  }


}


class AddCounterState extends State<AddCounter>{

  int count = 0;
  StreamController<int> controller = StreamController();

  void  addCounter(){
    count++;
    controller.add(count);

  }

  void decCount(){
    count--;
    controller.add(count);
  }

  @override
  void initState() {
    controller.add(count);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
TextEditingController controllerText = TextEditingController();
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             StyledText(text: "Here is your counter number"),
             SizedBox(height: 20,),

             CustomTextField(controller: controllerText, obscureText: false, label: 'hi',),

             SizedBox(height: 40,),

             StreamBuilder(stream: controller.stream,
                 builder: (context,data){
               return StyledText(text: "${data.data}");

             }),


             SizedBox(height: 20,),

           ],
         ),
       ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){


            addCounter();
          },
           child: Icon(Icons.add),
          ),


          FloatingActionButton(onPressed: (){


            decCount();
          },
            child: Icon(Icons.minimize),
          ),
          FloatingActionButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyExampleOfInheritWidget()),
            );
          },
            child: Icon(Icons.next_plan),
          ),

        ],
      ),

    );
  }


}