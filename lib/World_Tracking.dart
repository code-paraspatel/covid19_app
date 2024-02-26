import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:covid19_tracker/Countries_Tracking.dart';
import 'package:covid19_tracker/Services/ApiServicesClass.dart';
import 'package:covid19_tracker/Services/network_info/conectivity_network.dart';
import 'package:covid19_tracker/widgets/no_internet%20screen.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldTracking extends StatefulWidget {
  const WorldTracking({super.key});

  @override
  State<WorldTracking> createState() => _WorldTrackingState();
}

class _WorldTrackingState extends State<WorldTracking> {

  ApiServicesClass apiServicesClass = ApiServicesClass();
 final colors=[
   Colors.orange,
   Colors.yellow,
   Colors.red
 ];
   bool? isConnected;
  late StreamSubscription subscription;
   late ConnectivityResult result;
  NetworkInfo internetCheck=NetworkInfo();

  checkInternet()async{
    result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){
      setState(() {
        isConnected=false;
        moveToScreen();
      });
    }else {
      setState(() {
        isConnected = true;
      });
    }
  }
  streamCheck(){
    subscription=Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        checkInternet();
      });
    });
  }
 moveToScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoInternetScreen(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            isConnected=true;
            checkInternet();
          });
        },),));
 }

  @override
  void initState() {
    super.initState();
    streamCheck();
  }
 @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title:  const Text('World Tracker',style: TextStyle(),),
         ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: apiServicesClass.worldApiGet(),
                  builder:(context, snapshot) {
                    if(snapshot.hasData){
                      return  SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                            PieChart(
                              chartRadius: 150,
                              dataMap: {
                                'Total':double.parse(snapshot.data!.cases.toString()),
                                'Recover':double.parse(snapshot.data!.recovered.toString()),
                                'Death':double.parse(snapshot.data!.deaths.toString())
                              } ,
                              chartValuesOptions:  ChartValuesOptions(
                                  decimalPlaces: 1,
                                  chartValueStyle: TextStyle(color:Colors.blue.shade500,fontSize: 18),
                                  showChartValueBackground: false,
                                  showChartValuesOutside: true,
                                  showChartValuesInPercentage: true),
                              animationDuration: const Duration(seconds: 3),
                              chartType: ChartType.ring,
                              colorList: colors,
                              legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left,
                                legendTextStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,left: 15),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ReushebleRow(
                                      title : 'Affected Countries',
                                      data: snapshot.data!.affectedCountries.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Cases',
                                      data: snapshot.data!.cases.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Active Cases',
                                      data: snapshot.data!.active.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Recovered',
                                      data: snapshot.data!.recovered.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Deaths',
                                      data: snapshot.data!.deaths.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Critical',
                                      data: snapshot.data!.critical.toString(),
                                    ),
                                    const Divider(indent: 25,endIndent: 25,),
                                    ReushebleRow(
                                      title: 'Today Cases',
                                      data: snapshot.data!.todayCases.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Today Recovered',
                                      data: snapshot.data!.todayRecovered.toString(),
                                    ),
                                    ReushebleRow(
                                      title: 'Today Deaths',
                                      data: snapshot.data!.todayDeaths.toString(),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }
                    else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  }, )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15,top: 5,bottom: 15),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesTracker(),));
                    },
                    child: const Text('Tracker Countries',style: TextStyle(fontSize: 20),)),
              ),
            ),
          ],
        ),
      ),

    );
  }

}
class ReushebleRow extends StatelessWidget {
  const ReushebleRow({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
          Text(data,style: const TextStyle(fontSize: 14),)
        ],
      ),
    );
  }
}
// myDialog(){
//   return  showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context){
//         return  AlertDialog(
//           title: const Text('No Internet'),
//           content: const Text('Please Check your Internet Connection in your Mobile'),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   setState(() {
//                     isConnected=true;
//                     checkInternet();
//                   });
//                 },
//                 child: const Text('RETRY'))
//           ],
//         );
//       }
//   );
// }