import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_search/pages/gif_view_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../fragments/appbar_fragment.dart';
import '../fragments/grid_fragment.dart';
import '../fragments/input_text_fragment.dart';

final client = http.Client();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _offSet = 0;

  String? _searchLabel;

  String trendingUrl() =>
      'https://api.giphy.com/v1/gifs/trending?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&limit=19&offset=$_offSet&rating=g&bundle=messaging_non_clips';

  String searchingUrl(String label) =>
      'https://api.giphy.com/v1/gifs/search?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&q=$label&limit=19&offset=$_offSet&rating=g&lang=pt&bundle=messaging_non_clips';

  Future<Map> _getGifs() async {
    late String url;

    if (_searchLabel == null) {
      url = trendingUrl();
    } else {
      url = searchingUrl(_searchLabel!);
    }

    http.Response response = await client.get(Uri.parse(url));

    return convert.jsonDecode(response.body);
  }

  _onTextFieldTap(String text) {
    setState(() {
      if (text.isEmpty) {
        _offSet = 0;
        _searchLabel = null;
      } else {
        _offSet = 0;
        _searchLabel = text;
      }
    });
  }

  _moreGifs() {
    setState(() {
      _offSet += 19;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment.getAppBar(null),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(
          children: [
            InputTextFragment(
              setSearchText: _onTextFieldTap,
            ),
            const SizedBox(height: 8),
            GridFragment(
              getGifs: _getGifs,
              moreGifs: _moreGifs,
            ),
          ],
        ),
      ),
    );
  }
}
