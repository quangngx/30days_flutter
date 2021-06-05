import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jiro\'s site'),
      ),
      body: WebView(
        initialUrl: 'https://kiloloco.com',
        onWebViewCreated: (controller) => _controller.complete(controller),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20, right: 20),
          child: ButtonBar(
            children: [
              navigationButtion(Icons.chevron_left_sharp,
                  (controller) => _goBack(controller)),
              SizedBox(width: 10),
              navigationButtion(Icons.chevron_right_sharp,
                  (controller) => _goForward(controller)),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButtion(IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder(
        future: _controller.future,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? IconButton(
                  icon: Icon(icon), onPressed: () => onPressed(snapshot.data))
              : Container();
        });
  }

  Future<void> _goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();
    if (canGoBack) {
      await controller.goBack();
    }
  }

  Future<void> _goForward(WebViewController controller) async {
    final canForward = await controller.canGoForward();
    if (canForward) {
      await controller.goForward();
    }
  }
}
