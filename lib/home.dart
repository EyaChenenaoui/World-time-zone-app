import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String img= data['isday']?'pic2.jpg':'pic1.webp';
    Color? c=data['isday']?Colors.yellow[700]:Colors.indigo;
    return Scaffold(
      backgroundColor:c,
      body:SafeArea
        (child:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/$img'),
            fit:BoxFit.cover,
          ),
        ),
        child:Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
          children:<Widget>[
           FlatButton.icon(
             onPressed:()async {
               dynamic result=await Navigator.pushNamed(context, '/choose_location');
               setState(() {
                 data={
                   'time':result['time'],
                   'location':result['location'],
                   'isday':result['isday']
                 };
               });
             },
             icon:Icon(Icons.edit_location,),
             label:Text('edit location'),
           ),
           SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text(
                  data['location'],
                  style:TextStyle(
                    fontSize: 28,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(height:20),
            Text(data['time'],
            style:TextStyle(
              fontSize:66,
            )),
    ],
    ),
        ),
      ),
      ),
    );
  }
}
