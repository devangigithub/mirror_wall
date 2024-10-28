// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// class DetailScreen extends StatefulWidget {
//   const DetailScreen({super.key});
//
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//
//   InAppWebViewController? inAppWebViewController;
//   @override
//   Widget build(BuildContext context) {
//
//     final String url = (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>)['url'] ?? '';
//     return Scaffold(
//            body: InAppWebView(
//     initialUrlRequest: URLRequest(url: WebUri(url)),
//     onWebViewCreated: (controller) {
//     inAppWebViewController = controller;
//     },
//     ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        onWebViewCreated: (controller) {
          inAppWebViewController = controller;
        },
      ),
    );
  }
}
