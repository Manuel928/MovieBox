// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NollyWoodPage extends StatelessWidget {
  const NollyWoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Nollywood Movies'),
      ),
      body: Center(
        child: Text('Nollywood Movies Page'),
      ),
    );
  }
}
