import 'package:covid19_tracker/Modal/CountriesModalClass.dart';
import 'package:covid19_tracker/World_Tracking.dart';
import 'package:flutter/material.dart';

class DetailesPage extends StatefulWidget {
  const DetailesPage(
      {super.key,required this.countries});

 final CountriesModalClass countries;

  @override
  State<DetailesPage> createState() => _DetailesPageState();
}

class _DetailesPageState extends State<DetailesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countries.country.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:8,right:8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                         child: Column(
                              children: [
                                ReushebleRow(title: 'Country ISO3', data: widget.countries.countryInfo!.iso3.toString()),
                                ReushebleRow(title: 'Country Code', data: widget.countries.countryInfo!.iId.toString()),
                                 ReushebleRow(title: 'Population', data: widget.countries.population.toString()),
                      ReushebleRow(title: 'Cases', data: widget.countries.cases.toString()),
                      ReushebleRow(title: 'Active', data: widget.countries.active.toString()),
                     ReushebleRow(title: 'Critical', data: widget.countries.critical.toString()),
                     ReushebleRow(title: 'Recovered', data: widget.countries.recovered.toString()),
                     ReushebleRow(title: 'Deaths', data: widget.countries.deaths.toString()),
                     ReushebleRow(title: 'Today Cases', data: widget.countries.todayCases.toString())
                    ],
                  ),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                    backgroundImage: NetworkImage(widget.countries.countryInfo?.flag.toString() ?? const Icon(Icons.error).toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
