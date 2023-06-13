// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Action'),
      ),
      body: Center(
        child: Text('Action Page'),
      ),
    );
  }
}
