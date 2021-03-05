
import 'package:flutter/material.dart';
import 'package:gadgets_app/screens/drawer.dart';
class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController gadgetcode=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Delete Gadget"),
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
                child: Text("DELETE"),
              ),


            ],
          ),
        ),
      ),
    );

  }
}



