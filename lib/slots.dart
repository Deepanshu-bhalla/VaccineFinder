import 'package:flutter/material.dart';
import 'package:vaccinefinder/web.dart';

class Slot extends StatefulWidget {
  final List slots;

  const Slot({Key key, this.slots}) : super(key: key);

  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Slots"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: widget.slots.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.deepPurpleAccent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.deepPurpleAccent,
                            size: 24,
                          ),
                          Text(
                            widget.slots[index]['name'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "        " + widget.slots[index]['address'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            widget.slots[index]['vaccine'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: widget.slots[index]['vaccine'].toString() ==
                                    "COVAXIN"
                                ? 200
                                : 180,
                          ),
                          Text(
                            'Slots - ' +
                                widget.slots[index]['available_capacity']
                                    .toString(),
                            style: TextStyle(
                              color: (widget.slots[index]
                                          ['available_capacity'] <=
                                      0)
                                  ? (Colors.red)
                                  : (Colors.green),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookSlot()));
                          },
                          child: Text("Book Now"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
