// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> with WidgetsBindingObserver {
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
    print('TimerWidget initState()');
    startTimer();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print('TimerWidget dispose()');
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('TimerWidget build():  $counter');
    return Text('TimerWidget: $counter');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// why doesn't this get called?
    print('TimerWidget didChangeAppLifecycleState(): $state');
  }
}
