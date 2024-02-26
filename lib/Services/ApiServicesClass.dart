import 'dart:convert';
import 'package:covid19_tracker/Modal/CountriesModalClass.dart';
import 'package:covid19_tracker/Modal/worldModalClass.dart';
import 'package:covid19_tracker/Services/Utilies/Apiurl.dart';
import 'package:http/http.dart' as http;

class ApiServicesClass{


  Future<WorldModalClass> worldApiGet()async {
    final response = await http.get(Uri.parse(ApiUrl.worldApiUrl));
    try {
      // Iterable unknown = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(response.body.toString());
        final unknown = jsonDecode(response.body.toString());
         var  data = WorldModalClass.fromJson(unknown as Map<String, dynamic>);
        return data;
      }else{
        throw Exception('${response.statusCode.toString()},Error');
      }
    }
    catch (e) {
      throw Exception(response.statusCode.toString());
    }
  }


  //countries api
  Future <List<CountriesModalClass>> countriesApiGet() async {
    final response = await http.get(Uri.parse(ApiUrl.countiesApiUrl));
    try{
      Iterable unknown = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(response.body);
        List<CountriesModalClass> data =List<CountriesModalClass>.from(unknown.map((e) => CountriesModalClass.fromJson(e)));
        return data;
      }else{
        throw Exception('${response.statusCode.toString()}, Error');
      }
    }catch(e){
      throw Exception(response.statusCode.toString());
    }
  }

  }




