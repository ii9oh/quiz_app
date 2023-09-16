import 'package:flutter/material.dart';
import 'package:q_a/config/colors.dart';

SizedBox playButton({
  required Function() onPressed,
  required String text,
}) =>
    SizedBox(
        width: 132,
        height: 29,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(CustomColors().redColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)))),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              )),
        ));
