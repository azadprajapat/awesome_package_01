
import 'package:country_list_pick/country_list_pick.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutterpackage01/convexbar.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ffi';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:velocity_x/velocity_x.dart';

class ShareItem extends StatefulWidget {
  @override
  _ShareItemState createState() => _ShareItemState();
}

class _ShareItemState extends State<ShareItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sharing'),),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Share Files'),
            onPressed: (){
              shareFile();
            },
          ),
          "Country Code Picker".text.size(25).bold.makeCentered(),
          CountryListPick(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: false,
            isDownIcon: true,
            initialSelection: '+91',
            onChanged: (CountryCode code) {
              print(code.name);
              print(code.code);
              print(code.dialCode);
              print(code.flagUri);
            },
          ),

          RaisedButton(
            child: Text('Convex Bar'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>ConvexBar()));
            },
          ),

        ],
      )
    );
  }
  Future<void> shareFile() async {
 File file= await FilePicker.getFile(type: FileType.any);
 final String path=(file).path;
 ShareExtend.share(path, "file");
  }


}
