import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class AddEmitStreams {

  void streamFunction() {

    StreamController<int> controller = StreamController<int>();

    controller.add(1);
    controller.add(2);
    controller.add(3);

    Stream stream = controller.stream;

    stream.listen((value){

      print("The value from controller is$value");
    });


    StreamSubscription  subscription =  getValues().listen((value) {
      print("The next double is ${value.toStringAsFixed(4)}"); // Formatted for better readability
    });

    subscription.cancel();

  }

  Stream<double> getValues() async* {
    var random = Random(); // Initialize Random without a fixed seed for varied numbers
    while (true) { // Changed from 'false' to 'true' to ensure the stream continuously yields values
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }

  }


  }
