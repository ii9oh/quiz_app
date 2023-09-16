// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_a/generated/l10n.dart';
import 'package:q_a/home/shared/play_button.dart';
import 'package:q_a/home/shared/player_name.dart';
import 'package:q_a/domain/controller/qa_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qaState = ref.watch(QaProvider);
    final qaNotifier = ref.read(QaProvider.notifier);
    final key = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                SizedBox(
                  height: 15,
                  width: 132,
                  child: Text(
                    S.of(context).username,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins-Med',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                playerName(
                  username: qaState.username,
                  key: key,
                ),
                SizedBox(
                  height: 67,
                ),
                playButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      qaNotifier.startGame(context);
                    }
                  },
                  text: S.of(context).play,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
