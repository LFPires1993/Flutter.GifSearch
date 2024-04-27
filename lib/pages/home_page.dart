import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../fragments/appbar_fragment.dart';

final client = http.Client();

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _offSet = 0;

  String? _searchLabel;

  String trendingUrl() =>
      'https://api.giphy.com/v1/gifs/trending?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&limit=20&offset=$_offSet&rating=g&bundle=messaging_non_clips';

  String searchingUrl(String label) =>
      'https://api.giphy.com/v1/gifs/search?api_key=9JHzXFPzwnHh6ploBS4U0l3yIsCaA3rI&q=$label&limit=20&offset=$_offSet&rating=g&lang=pt&bundle=messaging_non_clips';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment.getAppBar(),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<Map>(
                  future: _getGifs(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeAlign: 10,
                            strokeWidth: 15,
                            strokeCap: StrokeCap.round,
                            color: Colors.white,
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Erro ao carregar dados: ${snapshot.error}',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.yellowAccent,
                              ),
                            ),
                          );
                        } else {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: snapshot.data?['data'].length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Image.network(
                                  snapshot.data?['data'][index]['images']
                                      ['fixed_height']['url'],
                                  height: 300,
                                  fit: BoxFit.cover,

                                ),
                              );
                            },
                          );
                        }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
