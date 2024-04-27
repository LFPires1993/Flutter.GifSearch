import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

import '../pages/gif_view_page.dart';

class GifViewFragment extends StatelessWidget {
  const GifViewFragment({super.key, required this.gifAttributes});

  final dynamic gifAttributes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Share.share(gifAttributes['images']['original']['url']);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GifViewPage(
              gifAttributes: gifAttributes,
            ),
          ),
        );
      },
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: gifAttributes['images']['fixed_height']['url'],
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
