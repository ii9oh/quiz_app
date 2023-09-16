// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_a/domain/Model/question_model.dart';
import 'package:q_a/domain/controller/qa_controller.dart';
import 'package:q_a/domain/state/qa_state.dart';
import 'package:q_a/game/shared/list_view_builder.dart';
import 'package:q_a/game/shared/progress_bar.dart';
import 'package:q_a/game/shared/question_button.dart';
import 'package:q_a/game/shared/timer.dart';

import '../generated/l10n.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  @override
  Widget build(BuildContext context) {
    final qaState = ref.watch(QaProvider);
    final qaNotifier = ref.read(QaProvider.notifier);

    return qaState.status == QaStatus.loading
        ? CircularProgressIndicator()
        : Scaffold(
            body: SafeArea(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset("images/logo.png"),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    // Progress Bar
                    progressBar(
                        percent: qaState.barPercent,
                        text: "${qaState.questionIndex + 1} / 5"),

                    SizedBox(
                      height: 22,
                    ),
                    // Timer
                    Timer(
                      questionNumber: qaState.questionNumber.toString(),
                      questionText: qaState.questionEnd
                          ? ""
                          : list[qaState.questionIndex].question,
                    ),

                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                              onTap: () {
                                if (qaState.answerSelected) {
                                  return;
                                }
                                qaNotifier.questionAnswer(index);
                              },
                              child: listViewBuilder(
                                color: qaState.answerSelected
                                    ? qaNotifier.checkAnswer(index)
                                        ? Color.fromARGB(199, 43, 237, 49)
                                        : Color.fromARGB(222, 254, 67, 53)
                                    : Colors.white,
                                widget: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        list[qaState.questionIndex]
                                            .answers[index]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins-Med',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 34,
                    ),
                    questionButton(
                      onPressed: () {
                        if (!qaState.answerSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(S.of(context).chooseAnswer),
                            ),
                          );
                          return;
                        }
                        qaNotifier.nextQuestion(context);
                      },
                      text: qaState.questionEnd
                          ? S.of(context).seeScore
                          : S.of(context).nextQuestion,
                    ),
                  ],
                ),
              ),
            )),
          );
  }
}
