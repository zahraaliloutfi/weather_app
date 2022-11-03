import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    //rebuild update ui
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
