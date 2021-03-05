import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgets_app/screens/add.dart';
import 'package:gadgets_app/screens/drawer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


void  main(){
  runApp(Home());
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gadgets"),
          backgroundColor: Colors.green,
        ),
        drawer: MyDrawer(),
        body: Add(),
      ),
    );
  }
}
