import 'package:flutter/material.dart';
import 'package:mentra/utils/constants.dart';

class StepCounterWidget extends StatefulWidget {
  const StepCounterWidget({super.key});

  @override
  State<StepCounterWidget> createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  int _steps = 0;
  String _status = 'Waiting...';

  // This would normally come from a step counting service
  void _simulateStepCount() {
    // In a real app, you would connect to actual step counting functionality
    // This is just for demonstration
    setState(() {
      _steps = (_steps + 100) % 10000;
      _status = _steps > 5000 ? 'Active' : 'Idle';
    });
  }

  @override
  Widget build(BuildContext context) {
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
              'Daily Steps',
              style: kCardTitleStyle,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_steps',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Text(
                      'steps today',
                      style: kSubtitleStyle,
                    ),
                  ],
                ),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_walk,
                      color: kPrimaryColor,
                      size: 36,
                    ),
                  ),
                  onPressed: _simulateStepCount,
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: _steps / 10000,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
            const SizedBox(height: 8),
            const Text(
              'Goal: 10,000 steps',
              style: kSubtitleStyle,
              textAlign: TextAlign.right,
            ),
            Text(
              'Status: $_status',
              style: const TextStyle(
                fontSize: 12,
                color: kLightTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
