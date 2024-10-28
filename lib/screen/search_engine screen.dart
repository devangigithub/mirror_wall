import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Engines',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  final String googleUrl = 'https://www.google.com';
  final String bingUrl = 'https://www.bing.com';
  final String yahooUrl = 'https://www.yahoo.com';
  final String duckDuckGoUrl = 'https://www.duckduckgo.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Engines'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => (googleUrl),
              child: Text('Open Google'),
            ),
            ElevatedButton(
              onPressed: () => (bingUrl),
              child: Text('Open Bing'),
            ),
            ElevatedButton(
              onPressed: () => (yahooUrl),
              child: Text('Open Yahoo'),
            ),
            ElevatedButton(
              onPressed: () => (duckDuckGoUrl),
              child: Text('Open DuckDuckGo'),
            ),
          ],
        ),
      ),
    );
  }
}
