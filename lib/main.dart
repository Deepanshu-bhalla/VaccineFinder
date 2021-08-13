import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:vaccinefinder/about.dart';
import 'package:vaccinefinder/bottom.dart';
import 'package:vaccinefinder/slots.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pinkAccent),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/VaccineNew.png"),
        splashIconSize: 400,
        duration: 2000,
        nextScreen: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //-----------------------------------------------------------------
  TextEditingController pincodecontroller = TextEditingController();
  List slots = [];
  //-----------------------------------------------------------------

  DateTime date = DateTime.now();
  String Date;
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (picked != null) {
      setState(() {
        date = picked;
        Date = date.day.toString() +
            "-" +
            date.month.toString() +
            "-" +
            date.year.toString();

        print(Date);
      });
    }
  }

  fetchslots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pincodecontroller.text +
                '&date=' +
                Date))
        .then((value) {
      Map result = jsonDecode(value.body);
      //print(result);
      setState(() {
        slots = result['sessions'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Slot(
                    slots: slots,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 15,
        title: Text(
          "Covid-19 Vaccine Slot Finder",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => MyB(),
                ),
              },
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text("Find available vaccine slots"),
              ),
              Container(
                margin: EdgeInsets.all(40),
                height: 250,
                child: Image.asset('assets/images/vaccine.jpg'),
              ),
              TextField(
                controller: pincodecontroller,
                decoration: InputDecoration(
                  icon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.location_pin,
                      size: 28,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  )),
                  hintText: "Enter PIN Code",
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              IconButton(
                onPressed: () => {selectTimePicker(context)},
                icon: Icon(Icons.calendar_today_outlined),
                color: Colors.pinkAccent,
              ),
              (Date != null) ? Text("$Date") : Text("dd-mm-yyyy"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    fetchslots();
                  },
                  child: Text('Find Slots'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
