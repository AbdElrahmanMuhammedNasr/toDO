import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/BodyApp.dart';
import 'package:todo/formF.dart';

void main() {
  // DeviceOrientation.portraitUp;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.format_align_left),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
        ),
        body: new BodyFo(),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormF(),
            ));
          },
          child: Icon(Icons.add),
        ),

          drawer: Drawer(
            child: Text('data'),
          ),
      ),
    );
  }
}
