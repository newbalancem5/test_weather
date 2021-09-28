import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_weather/model/weather.dart';

class HttpWeatherServices {
  static String key = 'bffe3aa195984a049f4151850212609';
  // http://api.weatherapi.com/v1/current.json?key=$api_key&q=$name&aqi=yes&lang=ru

  static Future<WeatherServices>? currentWeatherService(
      {String? name = "Казань"}) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$key&q=$name&aqi=yes&lang=ru');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body);
      return WeatherServices.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('problem with loading weather api');
    }
  }

  static Future<List<WeatherServices>> daytimeWeatherService(
      {String name = "", String day = ""}) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=bffe3aa195984a049f4151850212609&q=$name&$day&aqi=yes&alerts=yes&lang=ru');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      final List<WeatherServices> data =
          (jsonData['list'] as List<dynamic>).map((item) {
        return WeatherServices.fromJson(item);
      }).toList();

      return data;
    } else {
      throw Exception('problem with loading weather api');
    }
  }
}
