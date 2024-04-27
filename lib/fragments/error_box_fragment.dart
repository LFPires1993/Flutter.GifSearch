import 'package:flutter/material.dart';

class ErrorBoxFragment extends StatelessWidget {
  const ErrorBoxFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Erro ao carregar dados!',
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}
