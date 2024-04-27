import 'package:flutter/material.dart';
import 'package:giphy_search/fragments/progress_bar_fragment.dart';

import '../pages/gif_view_page.dart';
import 'error_box_fragment.dart';
import 'gif_view_fragment.dart';
import 'more_gifs_view_fragment.dart';

class GridFragment extends StatelessWidget {
  const GridFragment({super.key, required this.getGifs, required this.moreGifs});

  final Function() getGifs;
  final Function() moreGifs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Map>(
        future: getGifs(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const ProgressBarFragment();
            default:
              if (snapshot.hasError) {
                return const ErrorBoxFragment();
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: snapshot.data?['data'].length + 1,
                  itemBuilder: (context, index) {
                    if (index < snapshot.data?['data'].length) {
                      return GifViewFragment(
                          gifAttributes: snapshot.data?['data'][index]);
                    } else {
                      return MoreGifsViewFragment(moreGifs: moreGifs);
                    }
                  },
                );
              }
          }
        },
      ),
    );
  }
}
