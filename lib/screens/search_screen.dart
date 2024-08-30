import 'dart:math';

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String id = '/search_screen';

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sweep Gradient with Needle'),
        ),
        body: GradientNeedleDemo(),
      ),
    );
  }
}

class GradientNeedleDemo extends StatefulWidget {
  @override
  _GradientNeedleDemoState createState() => _GradientNeedleDemoState();
}

class _GradientNeedleDemoState extends State<GradientNeedleDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [Colors.black, Colors.white],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          // Needle
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi, // Rotates from 0 to 2π radians
                child: child,
              );
            },
            child: Container(
              width: 5,
              height: 100,
              color: Colors.red, // Needle color
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}