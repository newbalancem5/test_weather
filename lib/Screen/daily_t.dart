import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_weather/Screen/error_page.dart';
import 'package:test_weather/const/_const.dart';
import 'package:test_weather/model/weather.dart';
import 'package:test_weather/services/weatherapi.dart';
import 'package:test_weather/style/_main.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

Future<WeatherServices>? data;

class _CurrentWeatherState extends State<CurrentWeather> {
  var data;
  String? city;

  @override
  void initState() {
    data = HttpWeatherServices.weatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
                width: displayWidth(context) / 1.2,
                child: TextField(
                    onChanged: (value) {
                      city = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Введите город',
                      icon: FaIcon(FontAwesomeIcons.search),
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  if (city != null) {
                    data =
                        HttpWeatherServices.weatherData(cityWeather: "$city");
                    setState(() {});
                  }
                },
                child: Text(search),
              ),
            ),
            Container(
              width: displayWidth(context) / 1.1,
              height: displayHeight(context) / 2,
              decoration: ContainerDecoration.customconntainerdecoration,
              child: Column(
                children: [
                  FutureBuilder<WeatherServices?>(
                      future: data,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    '${snapshot.data?.location?.name}',
                                    style: FontStyleText.title,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  //color: Colors.blue,
                                  height: 128,
                                  width: 128,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "http:${snapshot.data?.current?.condition?.icon}"),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    child: Text(
                                      'Температура на улице: ${snapshot.data?.current?.tempC} °C',
                                      style: FontStyleText.info,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    child: Text(
                                      'Температура на: ${snapshot.data?.current?.lastUpdated}',
                                      style: FontStyleText.info,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          ErrorPage();
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
