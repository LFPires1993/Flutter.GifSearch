import 'package:flutter/material.dart';
import 'package:giphy_search/fragments/appbar_fragment.dart';

class GifViewPage extends StatelessWidget {
  const GifViewPage({super.key, required this.gifAttributes});

  final Map gifAttributes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment.getAppBar(gifAttributes['images']['original']['url']),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                gifAttributes['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child:
                    Image.network(gifAttributes['images']['original']['url']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
