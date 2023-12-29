import 'package:flutter/material.dart';

class deae extends StatelessWidget {
  const deae({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(135, 201, 255, 1),
          title: const Text('الدعاء'),
          centerTitle: true,
        ),
      ),
    );
  }
}
