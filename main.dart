import 'package:flutter/material.dart';
import './second_page.dart';

// ./ for search
import './database_helper.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  final dbHelper = DataBaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: delete, child: Text("delete"),color: Colors.red,),
            FlatButton(
              onPressed: insert,
              child: Text("insert"),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: update,
              child: Text("update"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  void update() async{
    Map<String,dynamic> row;

    row = {
      DataBaseHelper.columnId: 7,
      DataBaseHelper.columnName: "Amir",
      DataBaseHelper.columnAge: 33
    };

    int id = await dbHelper.update(row);

//    print("Data with the id of " + id.toString() + " and name of " + row[DataBaseHelper.columnName]+ " age is "+ row[DataBaseHelper.columnAge].toString());
  }

  void delete() async{
    int id = await dbHelper.delete(4);

    print("Data with id " + id.toString() + " deleted");
  }

  void insert() async {
    Map<String,dynamic> row;
    row = {
      DataBaseHelper.columnName: 'Ali',DataBaseHelper.columnAge: 21
    };
    var id = await dbHelper.insert(row);
    print("Data with the id of " + id.toString() + " and name of " + row[DataBaseHelper.columnName]+ " age is "+ row[DataBaseHelper.columnAge].toString());
  }
}

// pub.dev for packages

/*class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Main page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("First page"),
            SizedBox(height: 50.0,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150.0),),
              color: Colors.red.shade600,
              onPressed: () {
                // for splash screen and we
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
//                  return SecondPage();
//                }));
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SecondPage.named();
                }));
              },
              child: Text("next page"),
            )
          ],
        ),
      ),
    );
  }
}*/
