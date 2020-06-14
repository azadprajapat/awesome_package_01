import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Scanner.dart';
import 'ShareItem.dart';
import 'onBoardingPage.dart';
import 'package:flutterpackage01/waterflow.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
      home: OnBoardingPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar:  VxAppBar(
        title: "bot toast".text.color(Colors.white).makeCentered(),
      ),
      body:  ListView(
        children: <Widget>[
          SizedBox(
            child: Text('velocityx package  for styling text and boxes').text.color(Colors.orangeAccent).bold.makeCentered(),
          ),
          RaisedButton(
            child: Text('show Text').centered(),
            onPressed: (){
              BotToast.showText(text: 'hello user');
            },
          ),
          RaisedButton(
            child: Text('simple notification').text.color(Colors.orangeAccent).bold.make(),
            onPressed: (){
              BotToast.showSimpleNotification(title: 'hello user');
            },
          ),
          RaisedButton(
            child: Text('show loading'),
            onPressed: (){
              BotToast.showLoading(
                duration: Duration(seconds: 3)
              );

            },
          ),
          RaisedButton(
            child: Text('attached widget'),
            onPressed: (){
              BotToast.showAttachedWidget(attachedBuilder: (_)=>Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    child: Text('loading...'),
                  )
                ),
              ),
                enableSafeArea: true,
                allowClick: true,
                duration: Duration(seconds: 3),
                target: Offset(520,520)
              );
               },
          ),
          RaisedButton(
              child:Text('Grid flow'),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WaterFlow()));

              }
          ),
          RaisedButton(
            child: Text('qr scanner'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Scanner()));

            },
          ),

          RaisedButton(
            child: Text('Sharing package'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShareItem()));
            },
          ),

        ],
      )
     );
  }
}
