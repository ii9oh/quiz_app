// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/colors.dart';
import '../domain/controller/qa_controller.dart';

class ScorePage extends ConsumerWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final QaState = ref.watch(QaProvider);
    final QaNotifier = ref.read(QaProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 88,
              ),
              Container(
                height: 78,
                width: 78,
                child: Image.asset("images/logo.png"),
              ),
              SizedBox(
                height: 36,
              ),
              Column(
                children: [
                  Text(
                    " ${QaState.username.text} your score is",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    QaState.score.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 64,
              ),
              SizedBox(
                  width: 150,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          QaNotifier.playAgain(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                CustomColors().redColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)))),
                        child: Text(
                          "Play Again",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        )),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
