import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookSlot extends StatefulWidget {
  @override
  _BookSlotState createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Co-WIN Application"),
      ),
      body: Container(
        child: SafeArea(
          child: WebView(
            initialUrl: "https://selfregistration.cowin.gov.in/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
