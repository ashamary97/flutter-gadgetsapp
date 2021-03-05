
import 'package:flutter/material.dart';
import 'package:gadgets_app/model/gadgets.dart';
import 'package:gadgets_app/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Future<Gadgets> searchData(String apiLink, mobilename) async{

    return http.post(apiLink,body:mobilename).then( (http.Response response){
      print(response.body.toString());

      var result=json.decode(response.body);

      if(result.length==0)
      {
        print("Invalid");
        brandname.text="";
        sellingprice.text="";
        mrp.text="";
      }
      else{
        var getbrandname=result[0]['brand'];
        var getsellingprice=result[0]['sellingprice'];
        var getmrp=result[0]['mrp'];

        setState(() {
          brandname.text=getbrandname;
          sellingprice.text=getsellingprice;
          mrp.text=getmrp;


        });
      }

      return json.decode(response.body);
    } );
  }

  TextEditingController mobilename=TextEditingController();
  TextEditingController brandname=TextEditingController();
  TextEditingController sellingprice=TextEditingController();
  TextEditingController mrp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Search Gadget"),
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
                controller: mobilename,
                decoration: InputDecoration(
                    hintText: "Enter Mobile Name",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0,),
              RaisedButton(onPressed: (){
                var getmobilename=mobilename.text.toString();
               var result= searchData("https://mygadgetsapp.herokuapp.com/search",{"mobilename":getmobilename});
               print(result);


              },
                color: Colors.green,
                child: Text("SEARCH"),
              ),
              TextField(
                controller: brandname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Brand Name",
                  hintText: ("Brand Name")
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: sellingprice,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Selling price",
                    hintText: ("Selling price")
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: mrp,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mrp",
                    hintText: ("Mrp")
                ),
              ),




            ],
          ),
        ),
      ),
    );

  }
}
