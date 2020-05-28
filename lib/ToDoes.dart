import 'package:flutter/material.dart';
import 'package:todo/db/database.dart';
import 'package:todo/formF.dart';
import 'package:todo/main.dart';

class ToDoesList extends StatefulWidget {
  @override
  _ToDoesListState createState() => _ToDoesListState();
}

class _ToDoesListState extends State<ToDoesList> {
  Databaseprovider databaseprovider = Databaseprovider();

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
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FormF(),
                  ));
                }),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: FutureBuilder(
                future: databaseprovider.getTask(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int pos) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("T"),
                            ),
                            title: Text("${snapshot.data[pos]['title']}"),
                            subtitle: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${snapshot.data[pos]['task']}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${snapshot.data[pos]['time']}",
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red,),
                              onPressed: (){
                                databaseprovider.deleteTask(snapshot.data[pos]['id']);
                                setState(() {
                                  databaseprovider.getTask();
                                });
                              },
                            ),
                          ),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}
