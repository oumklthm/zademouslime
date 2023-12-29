import 'package:flutter/material.dart';

class sebaha extends StatelessWidget {
  const sebaha({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(135, 201, 255, 1),
          title: const Text(' السبحة الألكترونيه'),
          centerTitle: true,
        ),
      ),
    );
  }
}
