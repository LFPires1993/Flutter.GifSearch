import 'package:flutter/material.dart';

class MoreGifsViewFragment extends StatelessWidget {
  const MoreGifsViewFragment({super.key, required this.moreGifs});

  final Function() moreGifs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: moreGifs,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            size: 60,
          ),
          Text(
            'Carregar mais',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
