
import 'package:flutter/material.dart';
import'home.dart';
import'choose_location.dart';
import 'package:world_time_app/loading_f.dart';
void main() =>runApp(MaterialApp(
  routes: {
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/choose_location':(context)=>Chooselocation(),

  },
),);

