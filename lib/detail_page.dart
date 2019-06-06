import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailPage extends StatefulWidget {
final String url;

  const DetailPage({Key key, this.url}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(url);
}

class _DetailPageState extends State<DetailPage> {
  final String url;

  _DetailPageState(this.url);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*appBar: AppBar(
          title: Text(""),
        ),*/
        body: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: WebView(
            initialUrl: url,
          ),
        ),
      )
    );
  }
}
