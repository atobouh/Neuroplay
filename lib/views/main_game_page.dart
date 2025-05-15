import 'package:flutter/material.dart';

class MainGamePage extends StatelessWidget {
  const MainGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeuroPlay'),
        backgroundColor: const Color(0xFF008080),
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          GameCard(
            title: 'Phonics Explorer',
            icon: Icons.music_note,
            description: 'Match sounds to letters',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PhonicsExplorerGame()),
            ),
          ),
          GameCard(
            title: 'Word Builder',
            icon: Icons.construction,
            description: 'Build words from syllables',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WordBuilderGame()),
            ),
          ),
          GameCard(
            title: 'Pattern Seeker',
            icon: Icons.grid_on,
            description: 'Find letter patterns',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PatternSeekerGame()),
            ),
          ),
          GameCard(
            title: 'Progress',
            icon: Icons.bar_chart,
            description: 'Track your learning',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProgressScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final VoidCallback onTap;

  const GameCard({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: const Color(0xFF008080),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}