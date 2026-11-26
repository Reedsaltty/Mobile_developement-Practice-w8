import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice_w8/EXERCISE-2/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';

enum Pages { welcome, temScreen }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  Pages currentPage = Pages.welcome;

  void goToTempPage() {
    setState(() {
      currentPage = Pages.temScreen;
    });
  }

  void goToWelcome() {
    setState(() {
      currentPage = Pages.welcome;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: switch (currentPage) {
            Pages.welcome => WelcomeScreen(goToTempPage: goToTempPage),
            Pages.temScreen => TemperatureScreen(goToWelcomePage: goToWelcome),
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
