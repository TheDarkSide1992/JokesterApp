import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jokester/data_source.dart';
import 'package:jokester/joke_screen.dart';
import 'package:provider/provider.dart';

import 'settings.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => DataSource()),
        Provider(create: (context) => Settings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JOKE",
      home: JokeScreen(),
    );
  }
}
