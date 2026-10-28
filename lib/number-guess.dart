import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const GuessNumberApp());
}

class GuessNumberApp extends StatelessWidget {
  const GuessNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GuessGameScreen(),
    );
  }
}

class GuessGameScreen extends StatefulWidget {
  const GuessGameScreen({super.key});

  @override
  State<GuessGameScreen> createState() =>
      _GuessGameScreenState();
}

class _GuessGameScreenState extends State<GuessGameScreen> {
  final Color green = const Color(0xFF0DA526);
  final Color background = const Color(0xFF160606);
  final Color buttonBackground = const Color(0xFF0C101D);

  int targetNumber = 5;
  int score = 240;
  String enteredNumber = '';

  void pressNumber(String number) {
    setState(() {
      if (enteredNumber.length < 2) {
        enteredNumber += number;
      }
    });
  }

  void clearNumber() {
    setState(() {
      enteredNumber = '';
    });
  }

  void checkNumber() {
    if (enteredNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a number')),
      );
      return;
    }

    int guess = int.parse(enteredNumber);

    setState(() {
      if (guess == targetNumber) {
        score += 10;
        targetNumber = Random().nextInt(10);
        enteredNumber = '';
      } else {
        score = max(0, score - 10);
        enteredNumber = '';
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          guess == targetNumber
              ? 'Correct!'
              : 'Try again!',
        ),
      ),
    );
  }

  Widget numberButton(String text) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: () {
          if (text == 'C') {
            clearNumber();
          } else {
            pressNumber(text);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackground,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          side: BorderSide(color: green, width: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }

  Widget greenButton(
    String text, {
    double fontSize = 22,
  }) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: text == 'Score'
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Your score: $score')),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          disabledBackgroundColor: green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          text == '240' ? '$score' : text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  // Number circle
                  Container(
                    width: 198,
                    height: 198,
                    decoration: BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      enteredNumber.isEmpty
                          ? '$targetNumber'
                          : enteredNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // First row
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton('1'),
                      numberButton('2'),
                      numberButton('3'),
                      numberButton('C'),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // Second row
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton('4'),
                      numberButton('5'),
                      numberButton('6'),
                      greenButton('Score', fontSize: 20),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // Third row
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton('7'),
                      numberButton('8'),
                      numberButton('9'),
                      greenButton('240', fontSize: 30),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Last row
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton('0'),
                      SizedBox(
                        width: 244,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: checkNumber,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: background,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            side: BorderSide(
                              color: green,
                              width: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'check',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}