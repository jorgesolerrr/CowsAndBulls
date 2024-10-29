import 'package:cowsandbulls/pages/game_screen/game_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.6,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 133, 113, 67),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60))),
                      child: Center(
                        child: Image.asset(
                          "images/BullsAndCows.png",
                          scale: 0.8,
                        ),
                      ))
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Column(
                    children: [
                      const Text(
                        "¿Can you guess the number?",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 1),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GameScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 94, 78, 43),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 80),
                            elevation: 5),
                        child: const Text("Let's Play",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
