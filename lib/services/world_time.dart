import 'package:http/http.dart';
import'dart:convert';

import 'package:intl/intl.dart';
class WorldTime {
  String ?location ;//location name of the country
  String ?time;// time in that country
  String ?flag;// flag of the country
  String ?url;// api url
  bool? isday;
 WorldTime({required this.location,required this.flag,required this.url} );

  Future <void> getTime() async {
    try {
      Response response = await get(Uri.parse(
          'https://timezone.abstractapi.com/v1/current_time/?api_key=57f138f1fd4b49f7be8fec51b04c6731&location=$url'));
      Map data = jsonDecode(response.body);
      String t= data['datetime'];
      DateTime now =DateTime.parse(t);
      isday=now.hour<20 && now.hour>4 ? true:false ;
      time=t.substring(11,16);
    }
    catch (e) {
      print('error $e');
      time = 'error';
    }
  }
}