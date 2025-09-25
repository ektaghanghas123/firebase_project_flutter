import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<int>{
  CounterNotifier() : super(0);

  void increment() => value++;

  void decrement() => value--;
}

class CounterInherit extends InheritedWidget{
  final CounterNotifier counterNotifier;

  const CounterInherit(this.counterNotifier, {super.key, required super.child});

  @override
  bool updateShouldNotify( CounterInherit oldWidget) {
    return  counterNotifier!=oldWidget.counterNotifier;
  }

  static CounterInherit? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInherit>();
  }

}

class MyExampleOfInheritWidget extends StatelessWidget{

 final  CounterNotifier counterNotifier = CounterNotifier();

  MyExampleOfInheritWidget({super.key});
  @override
  Widget build(BuildContext context) {

     
    return CounterInherit(counterNotifier,

        child: MaterialApp(home: CounterScreen()));
  }
}

class CounterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final counterNotifier = CounterInherit.of(context)!.counterNotifier;
    return Scaffold(
      body: Center(
        child: Column(
           children: [

             ValueListenableBuilder(valueListenable: counterNotifier, builder: (context,count,_){
               return Text("$count");

             }
             )
           ],

        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: counterNotifier.decrement),
    );
  }


}