import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AppBarFragment {
  static const String _giphyLogoImage =
      'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif';

  static AppBar getAppBar(String? urlToShare) {

    final List<Widget> actions = urlToShare == null
        ? []
        : [
      IconButton(
        onPressed: () {
          Share.share(urlToShare);
        },
        icon: const Icon(Icons.share, color: Colors.white,),
      ),
    ];
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Image.network(_giphyLogoImage),
      centerTitle: true,
      actions: actions,
    );
  }
}
