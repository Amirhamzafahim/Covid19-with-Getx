import 'package:covid_19/apimode.dart';
import 'package:flutter/material.dart';

class Countrydeatails extends StatelessWidget {

  Responses datarcv;
 Countrydeatails({this.datarcv});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text(datarcv.country)),
      
    );
  }
}