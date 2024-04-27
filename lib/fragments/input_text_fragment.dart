import 'package:flutter/material.dart';

class InputTextFragment extends StatelessWidget {
  const InputTextFragment({super.key, required this.setSearchText});

  final Function(String) setSearchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: const InputDecoration(
        labelText: 'Pesquisar',
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      onSubmitted: setSearchText,
    );
  }
}
