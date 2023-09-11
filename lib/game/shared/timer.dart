import 'package:flutter/material.dart';
import 'package:q_a/config/colors.dart';
import 'package:slide_countdown/slide_countdown.dart';

class Timer extends StatelessWidget {
  final String questionNumber;
  final String questionText;
  const Timer({
    super.key,
    required this.questionNumber,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 72,
          child: SlideCountdown(
            duration: Duration(minutes: 5),
            separator: "-",
            onDone: () => Navigator.pushNamed(context, "/Score"),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            textStyle: TextStyle(color: Colors.black),
          ),
        ),
        const Text(
          "Countdown",
          style: TextStyle(fontFamily: 'Poppins-Med', fontSize: 8),
        ),
        const SizedBox(
          height: 27,
        ),
        // Question
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: SizedBox(
                    height: 17,
                    width: 80,
                    child: Text(
                      "Question - ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppnins',
                        fontSize: 14,
                        color: CustomColors().redColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  questionNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppnins',
                    fontSize: 14,
                    color: CustomColors().redColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 30,
                width: 340,
                child: Text(
                  questionText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Poppnins',
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
