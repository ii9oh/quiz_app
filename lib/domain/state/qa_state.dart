import 'package:flutter/material.dart';
import 'package:q_a/domain/Model/question_model.dart';

enum QaStatus { init, finished, loading }

class QaState {
  final TextEditingController username;
  final int score;
  final double barPercent;
  final Duration timer;
  final int questionNumber;
  final int questionIndex;
  final List<Question> list;
  final bool questionEnd;
  final bool answerSelected;
  final QaStatus status;

  QaState({
    required this.username,
    required this.score,
    required this.barPercent,
    required this.timer,
    required this.questionNumber,
    required this.questionIndex,
    required this.list,
    required this.questionEnd,
    required this.answerSelected,
    required this.status,
  });

  factory QaState.Initial() => QaState(
        username: TextEditingController(),
        score: 0,
        barPercent: 0.2,
        timer: Duration.zero,
        questionNumber: 1,
        questionIndex: 0,
        list: [],
        questionEnd: false,
        answerSelected: false,
        status: QaStatus.init,
      );

  QaState copyWith({
    TextEditingController? username,
    int? score,
    double? barPercent,
    Duration? timer,
    int? questionNumber,
    int? questionIndex,
    List<Question>? list,
    bool? questionEnd,
    bool? answerSelected,
    QaStatus? status,
  }) {
    return QaState(
      username: username ?? this.username,
      score: score ?? this.score,
      barPercent: barPercent ?? this.barPercent,
      timer: timer ?? this.timer,
      questionNumber: questionNumber ?? this.questionNumber,
      questionIndex: questionIndex ?? this.questionIndex,
      list: list ?? this.list,
      questionEnd: questionEnd ?? this.questionEnd,
      answerSelected: answerSelected ?? this.answerSelected,
      status: status ?? this.status,
    );
  }
}
