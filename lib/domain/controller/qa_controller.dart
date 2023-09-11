import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_a/domain/Model/question_model.dart';
import 'package:q_a/domain/state/qa_state.dart';

final QaProvider = StateNotifierProvider<QaNotifier, QaState>((ref) {
  return QaNotifier();
});

class QaNotifier extends StateNotifier<QaState> {
  QaNotifier() : super(QaState.Initial());

  void startGame(BuildContext context) {
    state = state.copyWith(
      status: QaStatus.init,
    );

    Navigator.pushNamed(context, "/Game");
    // time
  }

  void setInit() {
    state = state.copyWith(
      status: QaStatus.loading,
      username: TextEditingController(),
    );
  }

  bool checkAnswer(int index) {
    if (list[state.questionIndex]
            .answers
            .indexOf(list[state.questionIndex].answers[index]) ==
        list[state.questionIndex].correctAnswerIndex) {
      return true;
    }
    return false;
  }

  void questionAnswer(int index) {
    state = state.copyWith(answerSelected: true);

    if (checkAnswer(index)) {
      state = state.copyWith(score: state.score + 1);
    }

    if (list.length == state.questionIndex + 1) {
      state = state.copyWith(questionEnd: true);
    }
  }

  void nextQuestion(BuildContext context) {
    if (state.questionIndex >= list.length) {
      Navigator.pushNamed(context, "/Score");
    } else {
      state = state.copyWith(
          questionIndex: state.questionIndex + 1,
          questionNumber: state.questionNumber + 1,
          barPercent: state.barPercent == 1.0 ? 1.0 : state.barPercent + 0.20,
          answerSelected: false);
    }

    if (state.questionIndex >= list.length) {
      Navigator.pushNamed(context, "/Score");
    }
  }

  void playAgain(BuildContext context) {
    state = QaState.Initial();

    Navigator.pushNamed(context, "/");
  }
}
