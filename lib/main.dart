import 'package:flutter/material.dart';

import 'gradient_screen.dart';

void main() {
  runApp(

    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: GradientContainer(
              Color.fromARGB(179, 220, 79, 117),
              Color.fromARGB(179, 196, 116, 73)
          ),
        ),
      ),
    ),
  );
}
