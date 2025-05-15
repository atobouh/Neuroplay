import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Progress'),
        backgroundColor: const Color(0xFF008080),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Learning Progress',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildProgressCard(
            'Phonics Explorer',
            0.7,
            '70% Complete',
            Icons.music_note,
          ),
          const SizedBox(height: 16),
          _buildProgressCard(
            'Word Builder',
            0.45,
            '45% Complete',
            Icons.construction,
          ),
          const SizedBox(height: 16),
          _buildProgressCard(
            'Pattern Seeker',
            0.3,
            '30% Complete',
            Icons.grid_on,
          ),
          const SizedBox(height: 32),
          const Text(
            'Recent Achievements',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildAchievementCard(
            'First Word Master',
            'Completed 10 words in Word Builder',
            Icons.emoji_events,
          ),
          const SizedBox(height: 16),
          _buildAchievementCard(
            'Pattern Pro',
            'Found 5 patterns in a row',
            Icons.star,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(
    String title,
    double progress,
    String progressText,
    IconData icon,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF008080)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF008080)),
            ),
            const SizedBox(height: 8),
            Text(
              progressText,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF008080)),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}