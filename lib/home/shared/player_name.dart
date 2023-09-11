import 'package:flutter/material.dart';

SizedBox playerName({
  required TextEditingController username,
  required GlobalKey<FormState> key,
}) =>
    SizedBox(
      height: 33,
      width: 175,
      child: Form(
        key: key,
        child: Container(
          // ignore: sort_child_properties_last
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter your name';
              return null;
            },
            controller: username,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0.0, 2),
                )
              ]),
        ),
      ),
    );
