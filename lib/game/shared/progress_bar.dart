import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:q_a/config/colors.dart';
import 'package:q_a/generated/l10n.dart';

Row progressBar({
  required double percent,
  required String text,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (S.isArabic())
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins-Med',
              fontSize: 10,
            ),
          ),
        Container(
          width: 150,
          height: 26,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 12,
                  offset: Offset(0, .2),
                  spreadRadius: 0,
                )
              ]),
          child: LinearPercentIndicator(
            isRTL: S.isArabic() ? true : false,
            width: 150,
            lineHeight: 20,
            barRadius: Radius.circular(2),
            percent: percent,
            progressColor: CustomColors().blueColor,
            backgroundColor: Colors.white,
          ),
        ),
        if (!S.isArabic())
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins-Med',
              fontSize: 10,
            ),
          )
      ],
    );
