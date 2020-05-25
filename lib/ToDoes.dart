import 'package:flutter/material.dart';
import 'package:todo/formF.dart';
import 'package:todo/main.dart';

class ToDoesList extends StatefulWidget {
  @override
  _ToDoesListState createState() => _ToDoesListState();
}

class _ToDoesListState extends State<ToDoesList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormF(),));
            }),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int pos) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("P"),
                      ),
                      title: Text("data"),
                      subtitle: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "f",
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Dec 12 2020",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                }),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print('object');
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
