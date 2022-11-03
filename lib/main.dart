import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MyApp()));
}
//اول خطوه في state management
//هيا احدد عاوزه احط البروفايدر فين

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,

            primarySwatch:Provider.of<WeatherProvider>(context).weatherData == null?
        Colors.grey :
            Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()

        ),
        home: HomePage());
  }
}
