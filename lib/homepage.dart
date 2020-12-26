import 'package:covid_19/controller.dart';
import 'package:covid_19/fetchnigdata.dart';
import 'package:covid_19/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'countrydetails.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var controller = Get.put(Dataget());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          GetBuilder<Dataget>(
            init: controller,
            initState: (_) {
              fetchdata.getData().then((v) {
                controller.isLoading=false;

                controller.searchdata.sort((a, b) =>
                    a.country.toString().compareTo(b.country.toString()));
              });
            },
            builder: (_) {
              return Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],

                  
                ) ,
                child: TextField(
                  decoration:InputDecoration(
                    hintText: "Search Your Country",
                    prefixIcon:Icon(Icons.email) ,
                    
                    disabledBorder:InputBorder.none 
                    

                  ) ,
                  onChanged: (v) {
                    controller.serachcountry(v);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: GetBuilder<Dataget>(
            initState: (_) {},
            builder: (_) {
              return controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator()
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.searchdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(Country(
                              datarcv: controller.myFetchData.response[index],
                            ));
                          },
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Text(
                                controller.searchdata[index].country,
                                // filteredCountrie.s[index]['name'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      });
            },
          )),
        ],
      ),
    );
  }

  var fetchdata = FetchData();
}
