import 'package:flutter/material.dart';

class Catigory extends StatelessWidget {
  
  String type;
  int number;
  Widget icon;
  Catigory({this.type, this.number,this.icon});
 
 Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child:icon ,
            ),
            Text(type, style: TextStyle(fontSize: 20),),
            Text("$number"),
          ],
        ),
      ),
      
    );
  }
  }
