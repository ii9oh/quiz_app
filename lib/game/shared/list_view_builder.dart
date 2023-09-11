import 'package:flutter/material.dart';

Container listViewBuilder({
  Color? color,
  Widget? widget,
}) =>
    Container(
      height: 21,
      width: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 12,
              offset: Offset(0, .2),
              spreadRadius: 0,
            )
          ]),
      child: widget,
    );
