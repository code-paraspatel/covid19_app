// {
//  "updated" : 1638275845891,
//  "country" : "Afghanistan",
//  "countryInfo" : {"_id":4,"iso2":"AF","iso3":"AFG","lat":33,"long":65,"flag":"https://disease.sh/assets/img/flags/af.png"},
//  "cases" : 157289,
//  "todayCases" : 28,
//  "deaths" : 7308,
//  "todayDeaths" : 0,
//  "recovered" : 140549,
//  "todayRecovered" : 19,
//  "active" : 9432,
//  "critical" : 1124,
//  "casesPerOneMillion" : 3916,
//  "deathsPerOneMillion" : 182,
//  "tests" : 792156,
//  "testsPerOneMillion" : 19724,
//  "population" : 40162033,
//  "continent" : "Asia",
//  "oneCasePerPeople" : 255,
//  "oneDeathPerPeople" : 5496,
//  "oneTestPerPeople" : 51,
//  "activePerOneMillion" : 234.85,
//  "recoveredPerOneMillion" : 3499.55,
//  "criticalPerOneMillion" : 27.99
//  }


class CountriesModalClass {
  dynamic updated;
  String? country;
  CountryInfo? countryInfo;
  dynamic cases;
  dynamic todayCases;
  dynamic deaths;
  dynamic todayDeaths;
  dynamic recovered;
  dynamic todayRecovered;
  dynamic active;
  dynamic critical;
  dynamic casesPerOneMillion;
  dynamic deathsPerOneMillion;
  dynamic tests;
  dynamic testsPerOneMillion;
  dynamic population;
  String? continent;
  dynamic oneCasePerPeople;
  dynamic oneDeathPerPeople;
  dynamic oneTestPerPeople;
  dynamic activePerOneMillion;
  dynamic recoveredPerOneMillion;
  dynamic criticalPerOneMillion;

  CountriesModalClass(
      {this.updated,
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.tests,
        this.testsPerOneMillion,
        this.population,
        this.continent,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion});

  CountriesModalClass.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    continent = json['continent'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    data['country'] = country;
    if (countryInfo != null) {
      data['countryInfo'] = countryInfo!.toJson();
    }
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['todayRecovered'] = todayRecovered;
    data['active'] = active;
    data['critical'] = critical;
    data['casesPerOneMillion'] = casesPerOneMillion;
    data['deathsPerOneMillion'] = deathsPerOneMillion;
    data['tests'] = tests;
    data['testsPerOneMillion'] = testsPerOneMillion;
    data['population'] = population;
    data['continent'] = continent;
    data['oneCasePerPeople'] = oneCasePerPeople;
    data['oneDeathPerPeople'] = oneDeathPerPeople;
    data['oneTestPerPeople'] = oneTestPerPeople;
    data['activePerOneMillion'] = activePerOneMillion;
    data['recoveredPerOneMillion'] = recoveredPerOneMillion;
    data['criticalPerOneMillion'] = criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  dynamic iId;
  String? iso2;
  String? iso3;
  dynamic lat;
  dynamic long;
  String? flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['lat'] = lat;
    data['long'] = long;
    data['flag'] = flag;
    return data;
  }
}
