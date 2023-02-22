import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailViewScreen extends StatefulWidget {
  
 String newsUrl;

  DetailViewScreen({super.key, required this.newsUrl});


  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {

double _progress=0;
late InAppWebViewController webView;
GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.newsUrl),
              ),
              onWebViewCreated: (InAppWebViewController controller ){
                webView=controller;
              },
              onProgressChanged: (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress=progress/100;
                });
              },
          ),
          _progress<1?SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value:_progress,
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),
            ),
          ):SizedBox(),
        ],
      ),
    );
  }
}