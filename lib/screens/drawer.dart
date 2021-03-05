import 'package:flutter/material.dart';
import 'package:gadgets_app/screens/delete.dart';
import 'package:gadgets_app/screens/search.dart';
import 'package:gadgets_app/screens/update.dart';
import 'package:gadgets_app/screens/viewall.dart';
class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Asha"),
            accountEmail: Text("asha@gmail,com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewall()));
            },
            title: Text("View all"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
            },

            title: Text("Search"),

          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Update()));
            },

            title: Text("Update"),

          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Delete()));
            },


            title: Text("Delete"),

          ),
        ],
      ),
    );
  }
}
