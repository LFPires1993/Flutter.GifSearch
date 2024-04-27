import 'package:flutter/material.dart';
import 'package:giphy_search/pages/HomePage.dart';

main() => runApp(MaterialApp(
  home: HomePage(),
));

const trendingUrl = 'https://api.giphy.com/v1/gifs/trending?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&limit=25&offset=0&rating=g&bundle=messaging_non_clips';
const searchingUrl = 'https://api.giphy.com/v1/gifs/search?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&q=OQueEuQueroPesquisar&limit=25&offset=0&rating=g&lang=pt&bundle=messaging_non_clips';
