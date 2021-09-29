import 'package:amaizi_test/models/UserModel.dart';
import 'package:amaizi_test/services/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

late Future <List<UserModel>> futureData;
  @override
  void initState(){
    futureData = Service().fetchData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amaizi Test',),
        centerTitle: true,
      ),
      body:Center(
          child: FutureBuilder <List<UserModel>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<UserModel>? data = snapshot.data;
                return 
                ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 75,
                    color: Colors.white,
                    child: Center(child: Text(data[index].name),
                  ),);
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
      ),);
  }
}
//
