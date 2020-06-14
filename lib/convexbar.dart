import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpackage01/deviceinfo.dart';
import 'package:flutterpackage01/request.dart';
import 'package:flutterpackage01/slidable.dart';

import 'link.dart';


class ConvexBar extends StatefulWidget {
  @override
  _ConvexBarState createState() => _ConvexBarState();
}

class _ConvexBarState extends State<ConvexBar> {
  final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
         child: ListView(
           padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
               },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
               },
            ),
          ],
        ),
      ),
      appBar:  AppBar(
        title: Text("Convex App Bar"),
        actions: <Widget>[
          Icon(Icons.comment),
          Icon(Icons.settings),
        ],
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 50.0,
        bottom: PreferredSize(child: Icon(Icons.linear_scale,size: 60.0,), preferredSize: Size.fromHeight(50.0)),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('simple flushbar'),
            onPressed: (){
              Flushbar(
                title:  "Hey user",
                message:  "it is a simple flushbar",
                duration:  Duration(seconds: 3),
              )..show(context);

            },
          ),
          RaisedButton(
            child: Text('custom flushbar'),
            onPressed: (){
              Flushbar(
                title:  "Hey user",
                message:  "it is a simple flushbar",
                duration:  Duration(seconds: 3),
                flushbarPosition: FlushbarPosition.TOP,
                flushbarStyle: FlushbarStyle.FLOATING,
                reverseAnimationCurve: Curves.decelerate,
                isDismissible: true,
                dismissDirection: FlushbarDismissDirection.HORIZONTAL,

                forwardAnimationCurve: Curves.elasticOut,
                backgroundGradient: LinearGradient(colors: [Colors.green,Colors.blue]),
                icon: Icon(
                  Icons.check,
                  color: Colors.redAccent,
                ),
                mainButton: FlatButton(
                  onPressed: (){},
                  child: Text(
                    "hello",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                showProgressIndicator: true,
                progressIndicatorBackgroundColor: Colors.blueGrey,
                titleText: Text(
                  "hello here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.yellow
                  ),
                ),
                messageText: Text(
                  "customizable flush bar ",
                  style: TextStyle(
                    fontSize: 18.0,color: Colors.redAccent,fontFamily: "ShadowsIntoLight"
                  ),
                ),
               )..show(context);
            },
          ),
          RaisedButton(
           child: Text('Appbar Menu Drawer'),
           onPressed: (){
           } ,
          ),
          RaisedButton(
            child: Text('device info'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>DeviceInfo()));
            },
          ),
          RaisedButton(
            child: Text('flutter slidable'),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>Slidable_Flutter()));
            },
          ),
          RaisedButton(
            child: Text('Http Manager'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Request_Manager()));
            },
          ),
          RaisedButton(
            child: Text('youtube player'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LinkPreview()));

            },
          ),


        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '99+'},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        gradient: LinearGradient(colors: [Colors.green, Colors.blue]),
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
