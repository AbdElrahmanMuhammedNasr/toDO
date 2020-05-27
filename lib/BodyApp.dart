import 'package:flutter/material.dart';
import 'package:todo/Cat.dart';
import 'package:todo/ToDoes.dart';

class BodyFo extends StatefulWidget {
  @override
  _BodyFoState createState() => _BodyFoState();
}

class _BodyFoState extends State<BodyFo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Abdo",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Table(children: [
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToDoesList(),));
                        },
                        child: Catigory(
                          type: 'All',
                          number: 12,
                          icon: Icon(
                            Icons.apps,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ]),
                    // TableRow(children: [
                    //   GestureDetector(
                    //      onTap: () {
                    //        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToDoesList(),));
                    //     },
                    //     child: Catigory(
                    //       type: 'Work',
                    //       number: 12,
                    //       icon: Icon(Icons.work, color: Colors.blue),
                    //     ),
                    //   ),
                    // ]),
                    // TableRow(children: [
                    //   GestureDetector(
                    //      onTap: () {
                    //        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToDoesList(),));
                    //     },
                    //     child: Catigory(
                    //       type: 'Personal',
                    //       number: 12,
                    //       icon: Icon(
                    //         Icons.person,
                    //         color: Colors.blue,
                    //       ),
                    //     ),
                    //   ),
                    // ]),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
