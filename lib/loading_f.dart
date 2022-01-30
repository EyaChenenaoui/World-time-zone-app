import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import'package:world_time_app/services/world_time.dart';
import'package:flutter_spinkit/flutter_spinkit.dart';
import'home.dart';
class Loading extends StatefulWidget {

  @override

  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void setupTime() async
  {
    WorldTime instance = WorldTime(
        location: 'Tunisia', flag: 'image.png', url: 'Tunisia, Tunis');
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
       'flag':instance.flag,
      'time':instance.time,
      'isday':instance.isday
    });
  }
  void initState(){
    super.initState();
    setupTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body:Center(
         child:SpinKitFadingCube(
          color:Colors.white,
           size:50.0,
         ),
        ),
    );
  }
}