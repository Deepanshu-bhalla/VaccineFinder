import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.pinkAccent,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.redAccent, Colors.pinkAccent],
              ),
              //borderRadius: BorderRadius.only(b)
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/me.jpg"),
                      radius: 80.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "  Deepanshu Bhalla",
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.mail,
                                    color: Colors.pinkAccent,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "deepanshubhalla2000@gmail.com",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.call,
                                    color: Colors.pinkAccent,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "8881865469",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
