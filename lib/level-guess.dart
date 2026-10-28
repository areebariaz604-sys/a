
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LevelScreen(),
    );
  }
}

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Golden Logo Area
            Container(
              height: 390,
              width: double.infinity,
              color: const Color(0xFF160F20),
              child: Center(
                child: Image.asset(
                  'assets/golden_logo.png',
                  width: 280,
                  height: 280,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.waves,
                      color: Color(0xFFFFD54F),
                      size: 200,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 17),

            // Level 1
            levelButton(
              context,
              'assets/green_diamond.png',
              'Level 1',
              'Easy',
              Colors.green,
            ),

            const SizedBox(height: 42),

            // Level 2
            levelButton(
              context,
              'assets/blue_diamond.png',
              'Level 2',
              'Normal',
              Colors.blue,
            ),

            const SizedBox(height: 42),

            // Level 3
            levelButton(
              context,
              'assets/red_diamond.png',
              'Level 3',
              'Hard',
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget levelButton(
    BuildContext context,
    String imagePath,
    String title,
    String subtitle,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 94,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title selected')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1826C5),
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            elevation: 0,
          ),
          child: Row(
            children: [
              Container(
                width: 67,
                height: 67,
                color: Colors.white,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.diamond,
                      color: color,
                      size: 48,
                    );
                  },
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}