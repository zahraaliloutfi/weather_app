import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '258971d2539d40a7a2d111915223110';
  String days = '5';

 Future<WeatherModel> getWeather({required String cityName}) async {
    //حولته من استرنج ل يو ار ال اوبجيكت
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$days');
    //كلاس ريسبونس و عملت منه اوبجكت
    http.Response response = await http.get(url);
    // response.body;
    Map<String, dynamic> data = jsonDecode(response.body);
//weatherFromJsonDirect
    WeatherModel weather = WeatherModel.fromJson(data);
    // var jsonData = data["forecast"]["forecastday"][0]["day"];
//object
//     WeatherModel weather = WeatherModel(
//         date: data["location"]["localtime"],
//         name: data["location"]["name"],
//         temp: jsonData["avgtemp_c"],
//         maxTemp: jsonData["maxtemp_c"],
//         minTemp: jsonData["mintemp_c"],
//         weatherStateName: jsonData["condition"]["text"]);

    return weather;
    // print(data);
    // String locationName = data["location"]["name"];
    // String date = data["location"]["localtime"];
    // print('name = $locationName');
    // print('date = $date');
    // dynamic temp = data["forecast"]["forecastday"][0]["day"]["avgtemp_c"];
    // print('temp = $temp');
    // dynamic temp1 = data["forecast"]["forecastday"][0]["day"]["condition"]["text"];
    // print('temp1 = $temp1');
  }
}
