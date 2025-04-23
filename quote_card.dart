import 'package:flutter/material.dart';
import 'package:mentra/utils/constants.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get a random quote (in a real app, you might fetch this from an API)
    final quote =
        kMotivationalQuotes[DateTime.now().day % kMotivationalQuotes.length];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Motivation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quote,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- Mentra Team',
                style: TextStyle(
                  fontSize: 14,
                  color: kLightTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
