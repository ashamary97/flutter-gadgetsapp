

import 'package:flutter/material.dart';
import 'package:gadgets_app/screens/drawer.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController gadgetcode=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Update Gadget"),
          backgroundColor: Colors.blue,
        ),
        drawer: MyDrawer(),
        body: Container(
          padding: EdgeInsets.all(10.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: gadgetcode,
                decoration: InputDecoration(
                    hintText: "Enter code",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0,),
              RaisedButton(onPressed: (){
                String getcode=gadgetcode.text;
                print(getcode);
              },
                color: Colors.green,
                child: Text("UPDATE"),
              ),


            ],
          ),
        ),
      ),
    );

  }
}
