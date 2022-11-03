import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/survices/weather_survices.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  //عملت كونستركتر عشان اباصيلها الميثود
  // SearchPage({
  //  this. updateUi
  // });
  //
  // //عشان اخليها تقبل ميثود لاني هباصيلها ميثود
  // VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onFieldSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              //عشان اعمل اكسز علي الويزر ال في البروفايدر ال في المين
              //بيديك اكسز علي الاوبجكت عشان تدخل علي ال فيه
              Provider.of<WeatherProvider>(context , listen: false).weatherData =weather;
              Provider.of<WeatherProvider>(context , listen: false).cityName =cityName;
              // weatherData = weather;
              // updateUi!();
              Navigator.pop(context);
            },
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 16),
              label: Text('Search ..'),
              border: OutlineInputBorder(),
              hintText: 'searh a city ',
            ),
          ),
        ),
      ),
    );
  }
}

//global variable كل الكلاسز شايفاه
// WeatherModel? weatherData;
