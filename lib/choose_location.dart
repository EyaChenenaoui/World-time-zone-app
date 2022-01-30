import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
class Chooselocation extends StatefulWidget {

  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  @override
  List<WorldTime> lo = [
    WorldTime(url: 'Oxford, United Kingdom', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Tunis, Tunisia', location: 'Tunisia', flag: '2560px-Flag_of_Tunisia.svg.png'),
    WorldTime(url: 'Cairo, Egypt', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'USA, LA', location: 'Usa', flag: 'usa.png'),
    WorldTime(url: 'Germany, Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'UAE, Dubai', location: 'Dubai', flag: 'uae.svg.png'),
    WorldTime(url: 'France, Paris', location: 'Paris', flag: 'France.svg.png'),
    WorldTime(url: 'Italy, Roma', location: 'Roma', flag: 'Italy.svg.png'),
    WorldTime(url: 'Portugal, lisbon', location: 'lisbon', flag: 'Portugal.svg.png'),
    WorldTime(url: 'Japan, Tokyo', location: 'Tokyo', flag: 'Japan.svg.png'),
  ];
  void updateTime(index) async
  {
    WorldTime w=lo[index];
    await w.getTime();
    // send those info to home (back that's why we used pop)
    Navigator.pop(context,{
     'location': w.location,
      'flag':w.flag,
      'time':w.time,
      'isday':w.isday
    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blue[900],
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: lo.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal:4.0 ),
            child: Card(
            child: ListTile(
            onTap: (){
                updateTime(index);
            },
             title: Text(lo[index].location!),
              leading: CircleAvatar(
             backgroundImage: AssetImage('assets/${lo[index].flag}'),
              ),
            ),
            ),
          );
        }
          ),
    );
  }
}
