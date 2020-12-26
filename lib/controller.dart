import 'package:covid_19/apimode.dart';
import 'package:get/get.dart';

class Dataget extends GetxController {
  var myFetchData = Covid();

  var searchdata = List<Responses>();
  var searchdata2 = List<Responses>();


bool isLoading = true;
  //   var searchdata = Responses;
  // var searchdata2 = Responses;

    // var searchdata = List<Covid>();
  // var searchdata2 = List<Covid>();

  updateData(value) {
    // searchdata=value;
    // searchdata2=value;

    myFetchData = value;
    searchdata= myFetchData.response;
    searchdata2 = searchdata;
    // isLoading=false;
    update();
  }

  serachcountry(value) {
    searchdata = searchdata2
        .where((country) => country.country.contains("$value"))
        .toList();

        update();
  }
  // setLoading(){
  //   isLoading =true;
  //   update();
  // }

}
