import 'package:flutter/material.dart';
import 'package:gadgets_app/model/gadgets.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Gadgets> sendData(String apiLink, {Map body}) async{

  return http.post(apiLink,body:body).then( (http.Response response){
    print(response.body);

    return json.decode(response.body);
  } );
}


class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController getbrand=TextEditingController();
  TextEditingController getmobile=TextEditingController();
  TextEditingController getselling=TextEditingController();
  TextEditingController getmrp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: getbrand,
            decoration: InputDecoration(
                hintText: "Enter the Brand name",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10.0,),
          TextField(
            controller: getmobile,
            decoration: InputDecoration(
                hintText: "Enter the mobile name",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10.0,),
          TextField(
            controller: getselling,
            decoration: InputDecoration(
                hintText: "Enter selling price",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10.0,),
          TextField(
            controller: getmrp,
            decoration: InputDecoration(
                hintText: "Enter mrp",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10.0,),
          RaisedButton(onPressed: () async {
            String getbrandname=getbrand.text;
            String getmobilename=getmobile.text;
            String getsellingprice=getselling.text;
            String getnewmrp=getmrp.text;


            Gadgets gadgetdata= new Gadgets(
                brand:getbrandname,
                mobilename:getmobilename,
                sellingprice:getsellingprice,
                mrp:getnewmrp

            );

            Gadgets datatosend=await sendData("https://mygadgetsapp.herokuapp.com/read", body: gadgetdata.toJson());




          },
            child: Text("ADD"),
            color: Colors.green,)
        ],
      ),);
  }
}
