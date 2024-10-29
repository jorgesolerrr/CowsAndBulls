import 'package:cowsandbulls/pages/game_screen/widgets/number_changer_list.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bulls and Cows",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            wordSpacing: 1,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 133, 113, 67),
        foregroundColor: Colors.white,
      ),
      body: 
      const Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
        child: NumberChangerList(),
      ),
        )
    );
  }
}
