class WeatherModel {
  String date;
  String name;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.name,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  //named constuctor
  //jsonData is the same in weatherservice class

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    print('jsonData = ${jsonData["avgtemp_c"]}');
    // date= data["location"]["localtime"];
    // name= data["location"]["name"];
    // temp= jsonData["avgtemp_c"];
    // maxTemp= jsonData["maxtemp_c"];
    // minTemp= jsonData["mintemp_c"];
    // weatherStateName= jsonData["condition"]["text"];
    return WeatherModel(
        date: data["location"]["localtime"],
        name: data["location"]["name"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }
  @override
  String toString() {

    return 'date =$date ,temp = $temp ,state =$weatherStateName,';
  }

}
