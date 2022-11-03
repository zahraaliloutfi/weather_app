import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void updateUi(){
  //   setState(() {
  //
  //   });
  // }
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                      // updateUi: updateUi,
                      );
                }));
              },
              icon: Icon(Icons.search_off))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'there is no weather start searching now ..',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    // weatherData!.getThemeColor(),
                    // weatherData!.getThemeColor()[90],
                    // weatherData!.getThemeColor()[44],
                    // weatherData!.getThemeColor()[100],
                    Colors.red,
                    Colors.orange,
                    Colors.yellow
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                // color: weatherData!.getThemeColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(weatherData!.date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Image.asset(
                        //   weatherData?.getImage() ??'',
                        //   scale: 1,
                        // ),
                        Text(weatherData!.minTemp.toInt().toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        Column(
                          children: [
                            Text('max term :${weatherData!.maxTemp.toInt()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(
                              'min term: ${weatherData!.minTemp.toInt()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //weatherData?.weatherStateName ??''
                    Text(weatherData!.weatherStateName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Spacer(),
                  ],
                ),
              ),
            ),
    );
  }
}
