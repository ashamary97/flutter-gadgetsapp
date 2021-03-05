
import 'package:flutter/material.dart';
import 'package:gadgets_app/model/gadgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'drawer.dart';





class Viewall extends StatefulWidget {
  @override
  _ViewallState createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {

  Future<Gadgets> getData(String apiLink) async{

    return http.get(apiLink).then( (http.Response response){
     // print(response.body);
      gadgetlist=json.decode(response.body);
      print(gadgetlist);
      return json.decode(response.body);
    } );
  }



  List gadgetlist=[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("View all Gadgets"),
          backgroundColor: Colors.green,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(

            child: ListView.builder(
              shrinkWrap: true,
              //itemCount: gadgetlist.length,
               itemCount: gadgetlist.length==null?0:gadgetlist.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 10.0,
                    child: ListTile(
                      //title: Text(gadgetlist[index]),
                      title: Text(gadgetlist[index]['brand'].toString()),
                      subtitle: Text("mobilename:"+gadgetlist[index]['mobilename'].toString()),
                    ),

                  );

                })
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
getData("https://mygadgetsapp.herokuapp.com/viewall");
  }
}
