import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppbar;
  final bool backForBid;

  WebViewPage(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hideAppbar,
      this.backForBid});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }
}

class _WebViewState extends State<WebViewPage> {
  /// webView插件
  final webViewReference = FlutterWebviewPlugin();

  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    webViewReference.close();
    _onUrlChanged = webViewReference.onUrlChanged.listen((String url) {});
    _onStateChanged =
        webViewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          break;
        default:
          break;
      }
    });
    _onHttpError =
        webViewReference.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColor == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
          ),
          _appBar(context, Color(int.parse('0xff' + statusBarColor)),
              backButtonColor),
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text("waiting..."),
              ),
            ),
          ))
        ],
      ),
    ));
  }

  Widget _appBar(
      BuildContext context, Color backgroundColor, Color backButtonColor) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, null);
                  },
                  child: Container(
                    width: 49,
                    height: 49,
                    child: Icon(
                      Icons.navigate_before,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                      child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.network(
                      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3018968254,2801372361&fm=26&gp=0.jpg",
                      width: 30,
                      height: 30,
                    ),
                  )),
                ),
                Container(margin: EdgeInsets.only(left: 10), child: Text("张弘扬"))
              ],
            ),
          ],
        ));
  }
}
