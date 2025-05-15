import 'package:flutter/material.dart';

class PhonicsExplorerGame extends StatefulWidget {
  const PhonicsExplorerGame({super.key});

  @override
  State<PhonicsExplorerGame> createState() => _PhonicsExplorerGameState();
}

class _PhonicsExplorerGameState extends State<PhonicsExplorerGame> {
  final List<Map<String, dynamic>> levels = [
    {'letter': 'A', 'sound': 'Apple'},
    {'letter': 'B', 'sound': 'Ball'},
    {'letter': 'C', 'sound': 'Cat'},
  ];
  
  int currentLevel = 0;
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phonics Explorer'),
        backgroundColor: const Color(0xFF008080),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Match the Sound',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            Text(
              levels[currentLevel]['letter'],
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Color(0xFF008080),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                for (var item in levels)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCorrect = item['sound'] == levels[currentLevel]['sound'];
                        if (isCorrect && currentLevel < levels.length - 1) {
                          currentLevel++;
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isCorrect ? 'Correct!' : 'Try again!',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor:
                              isCorrect ? Colors.green : Colors.red,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(item['sound']),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}