
import 'package:covid_19/apimode.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Country extends StatelessWidget {
  Responses datarcv;
Country({this.datarcv});
  @override
  Widget build(BuildContext context) {
    // final Map country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        // title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Continent'),
              back: CountryDetailCard(
                title: datarcv.continent.toString(),
                // title: country['capital'],
                color: Colors.deepOrange,
              ),
            ),
             FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Population'),
              back: CountryDetailCard(
                title: datarcv.population.toString(),
                // title: country['capital'],
                color: Colors.deepOrange,
              ),
            ),
             FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Case'),
              back:Card(
                color: Colors.amber,
      elevation: 10,
                child:Column (  
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  
                  
                  children: [

                  Text("New: ${datarcv.cases.casesNew}"),
                  Text("Active: ${datarcv.cases.active}"),

                  Text("Critical: ${datarcv.cases.critical}"),

                  Text("Recovered: ${datarcv.cases.recovered.toString()}"),

                  Text("1M_pop: ${datarcv.cases.the1MPop}"),
                  Text("Total: ${datarcv.cases.total.toString()}"),



                ],),
              ) ,
           /*    back: CountryDetailCard(
                title: datarcv.cases.active.toString(),
                // title: country['capital'],
                color: Colors.deepOrange,
              ), */
            ),
             FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Deaths'),
             back: Card(
                color: Colors.amber,
      elevation: 10,
                child:Column (  
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  
                  
                  children: [

                  Text("New: ${datarcv.deaths.deathsNew}"),
                  Text("1M_pop: ${datarcv.deaths.the1MPop}"),

                  Text("Total: ${datarcv.deaths.total}"),

                



                ],),
              ) ,
            ),
             FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Tests'),
              back: Card(
                color: Colors.amber,
      elevation: 10,
                child:Column (  
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  
                  
                  children: [

                  Text("1M_pop: ${datarcv.tests.the1MPop}"),

                  Text("Total: ${datarcv.tests.total}"),

                



                ],),
              ) 
            ),
             FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Day & Time'),
              back: Card(
                color: Colors.amber,
      elevation: 10,
                child:Column (  
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  
                  
                  children: [

                  Text("Day: ${datarcv.day}"),

                  Text("Time: ${datarcv.time}"),

                



                ],),
              ) ,
            ),
         
          ],
        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  CountryDetailCard({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
