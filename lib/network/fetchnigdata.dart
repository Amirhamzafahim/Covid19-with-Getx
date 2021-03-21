
import 'package:covid_19/controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'apimode.dart';



class FetchData {
  Future getData() async {
    var url = "https://covid-193.p.rapidapi.com/statistics";
    var apikey="e208ee5657msh653df32cef1c4b5p1f987cjsnfee4568bb1d9";

    http.Response response = await http.get( url, headers:{
    
    "x-rapidapi-key":"e208ee5657msh653df32cef1c4b5p1f987cjsnfee4568bb1d9",
    
    }
    
    
    
     );
    if (response.statusCode == 200) {
      var controller = Get.put(Dataget());

      controller.updateData(covidFromJson(response.body));
      return response.body;
    } else {
      throw response.body;
    }
  }


}
