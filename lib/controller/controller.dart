import 'package:covid_19/apimode.dart';
import 'package:get/get.dart';

class Dataget extends GetxController {
  var myFetchData = Covid();

  var searchdata = List<Responses>();
  var searchdata2 = List<Responses>();


bool isLoading = true;

  updateData(value) {
    // searchdata=value;
    // searchdata2=value;

    myFetchData = value;
    searchdata= myFetchData.response;
    searchdata2 = searchdata;
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
