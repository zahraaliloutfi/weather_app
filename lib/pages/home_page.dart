import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
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
                child: Text('there is no weather start searching now ..',style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),),
              ),
            )
          : Center(
              child: Container(
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      'Cairo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: 15,),
                    Text('2/33/1111',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/img1.jpg',
                          scale: 10,
                        ),
                        Text('30',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),

                        Column(
                          children: [
                            Text('max term :30',style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('min term: 1',style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text('Clear',
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
