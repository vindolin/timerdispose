import 'package:flutter/material.dart';
import 'main.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other page'),
        leading: BackButton(
          /// we have to build our own back button because pushReplacement() did override the history stack
          /// when the last page used push() to navigate to this page, the back button will stay on the app bar after this page is popped :(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Other page'),
      ),
    );
  }
}
