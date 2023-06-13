// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      body: Center(
        child: Text('Music Page'),
      ),
    );
  }
}