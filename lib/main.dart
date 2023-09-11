import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_a/game/game_page.dart';
import 'package:q_a/home/home_page.dart';
import 'package:q_a/View/score_page.dart';
import 'config/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors().backgroundColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/Game": (context) => const GamePage(),
        "/Score": (context) => const ScorePage(),
      },
    );
  }
}
