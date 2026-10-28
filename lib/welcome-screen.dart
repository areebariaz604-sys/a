
import 'package:flutter/material.dart';

void main() {
  runApp(const GuessNumberApp());
}

class GuessNumberApp extends StatelessWidget {
  const GuessNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C101D),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  const SizedBox(height: 75),

                  // Game controller image
                  SizedBox(
                    height: 300,
                    width: 350,
                    child: Image.asset(
                      'assets/game_controller.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.sports_esports,
                          color: Color(0xFF9B70FF),
                          size: 180,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Game title
                  const Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Guses',
                        style: TextStyle(
                          color: Color(0xFF2868FF),
                          fontSize: 62,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 62,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Start button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: SizedBox(
                      width: 268,
                      height: 76,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GameScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF1827C9),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text(
                          'Start To Play',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Next screen
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C101D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C101D),
        foregroundColor: Colors.white,
        title: const Text('Guess Number'),
      ),
      body: const Center(
        child: Text(
          'Game Starts Here!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}