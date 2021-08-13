import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaccinefinder/about.dart';

class MyB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              leading: Icon(
                Icons.person,
                color: Colors.pinkAccent,
              ),
              title: Text("Meet Developer"),
            ),
            ListTile(
              onTap: () => {print("ShareApp")},
              leading: Icon(
                Icons.share,
                color: Colors.pinkAccent,
              ),
              title: Text("Share App"),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.pinkAccent,
              ),
              title: Text("Exit"),
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                          title: Text(
                            "Are You Sure?",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text("Do you want to exit from the App?"),
                          actions: [
                            FlatButton(
                              onPressed: () => {SystemNavigator.pop()},
                              child: Text(
                                "EXIT",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                "CANCEL",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                            )
                          ],
                        ))
              }, //SystemNavigator.pop()
            ),
          ],
        ),
      ),
    );
  }
}
