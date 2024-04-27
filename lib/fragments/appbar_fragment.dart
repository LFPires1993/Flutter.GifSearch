import 'package:flutter/material.dart';

class AppBarFragment {
  static const String _giphyLogoImage =
      'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif';

  static AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.network(_giphyLogoImage),
      centerTitle: true,
    );
  }
}
