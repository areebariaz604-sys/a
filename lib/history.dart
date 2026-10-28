
import 'package:flutter/material.dart';

class GameHistoryScreen extends StatelessWidget {
  const GameHistoryScreen({super.key});

  static const Color bgColor = Color(0xFF18065B);
  static const Color cardColor = Color(0xFF260A78);
  static const Color purple = Color(0xFF5B19E8);

  final List<Map<String, dynamic>> attempts = const [
    {
      'level': 'Level 1 • Easy',
      'date': 'Oct 14, 2026',
      'time': '10:24 AM',
      'guess': 5,
      'attempts': 2,
      'wrong': 1,
      'correct': true,
      'dice': 5,
    },
    {
      'level': 'Level 2 • Normal',
      'date': 'Oct 14, 2026',
      'time': '09:47 AM',
      'guess': 3,
      'attempts': 3,
      'wrong': 2,
      'correct': false,
      'dice': 2,
    },
    {
      'level': 'Level 3 • Hard',
      'date': 'Oct 14, 2026',
      'time': '08:32 AM',
      'guess': 6,
      'attempts': 1,
      'wrong': 0,
      'correct': true,
      'dice': 6,
    },
    {
      'level': 'Level 1 • Easy',
      'date': 'Oct 13, 2026',
      'time': '07:15 PM',
      'guess': 2,
      'attempts': 2,
      'wrong': 1,
      'correct': false,
      'dice': 1,
    },
    {
      'level': 'Level 2 • Normal',
      'date': 'Oct 13, 2026',
      'time': '06:40 PM',
      'guess': 4,
      'attempts': 3,
      'wrong': 2,
      'correct': true,
      'dice': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: const Color(0xFF10052F),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Game History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4D13C9),
                  Color(0xFF6418E8),
                ],
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: SummaryItem(
                    title: 'Total Games',
                    value: '12',
                  ),
                ),
                SummaryItem(
                  title: 'Correct',
                  value: '8',
                ),
                Expanded(
                  child: SummaryItem(
                    title: 'Wrong',
                    value: '4',
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: Text(
              'Recent Attempts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // History list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: attempts.length,
              itemBuilder: (context, index) {
                final item = attempts[index];
                final bool isCorrect = item['correct'];

                return HistoryCard(
                  level: item['level'],
                  date: item['date'],
                  time: item['time'],
                  guess: item['guess'],
                  attemptCount: item['attempts'],
                  wrongCount: item['wrong'],
                  isCorrect: isCorrect,
                  diceValue: item['dice'],
                );
              },
            ),
          ),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF10052F),
          border: Border(
            top: BorderSide(
              color: Color(0xFF382078),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(
                icon: Icons.home_outlined,
                label: 'Home',
                selected: false,
                onTap: () {},
              ),
              _navItem(
                icon: Icons.play_arrow,
                label: 'Play',
                selected: false,
                onTap: () {},
              ),
              _navItem(
                icon: Icons.history,
                label: 'History',
                selected: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final Color color =
        selected ? const Color(0xFF8B3DFF) : Colors.white70;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 21),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Summary item
class SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0x668F65FF),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Individual history card
class HistoryCard extends StatelessWidget {
  final String level;
  final String date;
  final String time;
  final int guess;
  final int attemptCount;
  final int wrongCount;
  final bool isCorrect;
  final int diceValue;

  const HistoryCard({
    super.key,
    required this.level,
    required this.date,
    required this.time,
    required this.guess,
    required this.attemptCount,
    required this.wrongCount,
    required this.isCorrect,
    required this.diceValue,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor =
        isCorrect ? const Color(0xFF20D875) : const Color(0xFFFF3D83);

    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF45209A),
          width: 0.7,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dice icon
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  color: const Color(0xFF6725F5),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.casino,
                  color: Colors.white,
                  size: 25,
                ),
              ),

              const SizedBox(width: 8),

              // Attempt details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white60,
                          size: 8,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '$date • $time',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your guess: $guess',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 3),

              // Correct / Wrong status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: Colors.white,
                      size: 9,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      isCorrect ? 'Correct' : 'Wrong',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          const Divider(
            color: Color(0xFF45209A),
            height: 1,
            thickness: 0.7,
          ),

          const SizedBox(height: 5),

          // Attempts and wrong answers
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Color(0xFF24D86E),
                size: 6,
              ),
              const SizedBox(width: 5),
              Text(
                'Attempts: $attemptCount',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 8,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 1,
                height: 10,
                color: Colors.white24,
              ),
              const SizedBox(width: 12),
              Text(
                'Wrong: $wrongCount',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
