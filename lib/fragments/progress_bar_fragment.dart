import 'package:flutter/material.dart';

class ProgressBarFragment extends StatelessWidget {
  const ProgressBarFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeAlign: 10,
        strokeWidth: 15,
        strokeCap: StrokeCap.round,
        color: Colors.white,
      ),
    );
  }
}
