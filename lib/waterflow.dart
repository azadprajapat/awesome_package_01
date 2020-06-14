import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_grid_view/smart_grid_view.dart';
import 'package:http/http.dart' as http;

class WaterFlow extends StatefulWidget {
  @override
  _WaterFlowState createState() => _WaterFlowState();
}

class _WaterFlowState extends State<WaterFlow> {
  List<RandomUserList> _list=List<RandomUserList>();

  @override
  void initState() {
    fetchUsers().then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    print('# list status 200 ${_list.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     if(_list.length==0){
     return CircularProgressIndicator();
    }
     else {
       return Scaffold(
         appBar: AppBar(
           title: Text('Grid View'),

         ),
         body: SmartGridView(
             tileHeight: 120,
             tileWidth: 180,
             children:
             List.generate(_list.length, (index) => Card(
                 child: Column(
                   children: <Widget>[
                     SizedBox(
                       height: 10,
                     ),
                     Container(
                       child: Image.network('https://i7.pngguru.com/preview/831/88/865/user-profile-computer-icons-user-interface-mystique.jpg'),
                       width: 180,
                       height: 140,
                     ),
                     SizedBox(
                       height: 35,
                     ),
                     Center(
                       child: Text(_list[index].name,style: TextStyle(color: Colors.white),),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Center(
                       child: Text(_list[index].email,style: TextStyle(color: Colors.white,fontSize: 10)),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Center(
                       child: Text(_list[index].phone,style: TextStyle(color: Colors.white,fontSize: 10)),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Center(
                       child: Text(_list[index].address.city,style: TextStyle(color: Colors.white,fontSize: 10)),
                     ),

                   ],
                 ),
                 color: Colors.green
             ))
         ),
       );
     }
  }
  Future<List<RandomUserList>> fetchUsers() async{
    final response = await http.get('https://jsonplaceholder.typicode.com/users/');
  var items=List<RandomUserList>();
    if (response.statusCode == 200) {
      var  jsonitems =await (json.decode(response.body));
      for(var jsonitem in jsonitems){
       await items.add(RandomUserList.fromJson(jsonitem));
      }
      print('# status 200 json item length ${items.length}');
      return items;

    } else {
       throw Exception('# status 400');
    }

  }
}
class RandomUserList{
  final String name;
  final String email;
  final Address address;
  final String phone;
  RandomUserList({this.email,this.name,this.address,this.phone});

  factory RandomUserList.fromJson(Map<String, dynamic> json) {
    return RandomUserList(
      name: json['name'],
      email: json['email'],
      address: Address.formJson(json['address']),
      phone: json['website'],
    );
  }
}
class Address {
    String city;
    Address(this.city);
    
   factory Address.formJson(Map<String, dynamic> json){
     return Address(json['city']);
   }
}
