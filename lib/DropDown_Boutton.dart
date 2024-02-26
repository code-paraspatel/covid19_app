import 'dart:convert';

import 'package:covid19_tracker/Modal/CountriesModalClass.dart';
import 'package:covid19_tracker/Services/Utilies/Apiurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDropDownScreen extends StatefulWidget {
  const MyDropDownScreen({super.key});

  @override
  State<MyDropDownScreen> createState() => _MyDropDownScreenState();
}

class _MyDropDownScreenState extends State<MyDropDownScreen> {
  var selectedValue;

  Future<List<CountriesModalClass>> countriGetApi()async{
    final response=await http.get(Uri.parse(ApiUrl.countiesApiUrl));
    final body = json.decode(response.body.toString()) as List;
    if (response.statusCode==200){
    return body.map((e) {
   //   final map=e as Map<String,dynamic>;
      return CountriesModalClass(
        country: e['country'],
        deaths: e['deaths']
      );
    }).toList();
    }else{
    throw Exception('error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Button'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         FutureBuilder(
           future: countriGetApi(),
             builder:(context, snapshot) {
               if (snapshot.hasData){
                 return Column(
                   children: [
                   Container(
                   width: 150,
                   child: DropdownButton(
                     isExpanded: true,
                     hint: const Text('Select Name'),
                     value: selectedValue,
                     items: snapshot.data!.map((e) {
                       return DropdownMenuItem(
                         alignment: Alignment.center,
                         value: e.country.toString(),
                         child: Text(e.country.toString()),
                       );
                     }).toList(),
                     onChanged: (value) {
                       setState(() {
                         selectedValue=value!;
                       });
                     },),
                 ),
                   Container(
                   width: 150,
                   child: DropdownButton(
                     isExpanded: true,
                     hint: const Text('Select death'),
                     value: selectedValue,
                     items: snapshot.data!.map((e) {
                       return DropdownMenuItem(
                         alignment: Alignment.center,
                         value: e.country.toString(),
                         child: Text(e.deaths.toString()),
                       );
                     }).toList(),
                     onChanged: (value) {
                       setState(() {
                         selectedValue=value!;
                       });
                     },),
                 ),

                   ],
                 );
               } else {
                 return const Center(child: CircularProgressIndicator(),);
               }
             }, ),
        ],
      )
    );
  }
}
