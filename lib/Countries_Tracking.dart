import 'package:covid19_tracker/DropDown_Boutton.dart';
import 'package:covid19_tracker/Modal/CountriesModalClass.dart';
import 'package:covid19_tracker/Services/ApiServicesClass.dart';
import 'package:covid19_tracker/detailes_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesTracker extends StatefulWidget {
  const CountriesTracker({super.key});

  @override
  State<CountriesTracker> createState() => _CountriesTrackerState();
}

class _CountriesTrackerState extends State<CountriesTracker> {
  //List<CountriesModalClass> countriesList=[];

  String searchbartext ='';
  TextEditingController searchController = TextEditingController();

  ApiServicesClass apiServicesClass = ApiServicesClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Countries Tracker'),
        actions: [
          IconButton(
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDropDownScreen(),));
          }, icon: const Text('D',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
        ],

      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Card(
            margin: const EdgeInsets.only(left: 8, right: 8),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search Hear',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )),
              onChanged: (value) {
                setState(() {
                  searchbartext = value;
                });
              },
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: apiServicesClass.countriesApiGet(),
            builder: (context,AsyncSnapshot<List<CountriesModalClass>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                     String searchtext =snapshot.data![index].country.toString();
                    if (searchbartext.isEmpty) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                 DetailesPage(
                                countries: snapshot.data![index],
                                ),
                          ));
                        },
                        leading: Image(
                            height: 50,
                            width: 50,
                            image: NetworkImage(snapshot.data![index].countryInfo!.flag.toString()),
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.error_outline));
                          },
                        ),
                        title: Text(snapshot.data![index].country.toString()),
                        subtitle: Text(snapshot.data![index].cases.toString()),
                      );
                    } else if (searchtext.toLowerCase().contains(searchController.text.toString())) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                DetailesPage(
                                  countries: snapshot.data![index],
                                ),
                          ));
                        },
                        leading: Image(
                            height: 50,
                            width: 50,
                            image: NetworkImage(snapshot.data![index].countryInfo!.flag.toString()),
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error_outline));
                        },
                        ),
                        title: Text(snapshot.data![index].country.toString()),
                        subtitle: Text(snapshot.data![index].cases.toString()),
                      );
                    }else{
                      return Container();
                    }
                  },
                );
              } else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }
              else {
                return
                  ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading:Container(height: 50,width: 50,color: Colors.white,),
                            title: Container(height: 10,width: double.infinity,color: Colors.white,),
                            subtitle: Container(height: 10,width: double.infinity,color: Colors.white,),
                          ),
                      );
                    },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
