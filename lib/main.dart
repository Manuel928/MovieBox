// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';

import 'pages/action_page.dart';
import 'pages/music_page.dart';
import 'pages/nollywood_page.dart';
import 'pages/privacy_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/home': (context) => HomePage(),
        '/action': (context) => ActionPage(),
        '/music': (context) => MusicPage(),
        'nollywood': (context) => NollyWoodPage(),
        '/privacy': (context) => PrivacyPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
