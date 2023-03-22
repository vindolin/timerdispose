// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int counter = 0;
  Timer? timer;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => setState(
        () => counter++,
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print('TimerWidget dispose()');
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print('TimerWidget build():  $counter');
    return Text('TimerWidget: $counter');
  }
}
