import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_weather/model/weather.dart';

class HttpWeatherServices {
  static String key = 'bffe3aa195984a049f4151850212609';
  // http://api.weatherapi.com/v1/current.json?key=$api_key&q=$name&aqi=yes&lang=ru

  void getWeatherKazan(String city) async {
    final queryParameters = {
      'key': key,
      'q': 'city',
    };
    final uri = Uri.http(
      'api.weatherapi.com',
      '/v1/current',
      queryParameters,
    );
    final response = await http.get(uri);
    print(response.body);
  }

  static Future<WeatherServices> currentWeatherService(
      {String name = ""}) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$key&q=$name&aqi=yes&lang=ru');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return WeatherServices.fromJson(json.decode(response.body));
    } else {
      throw Exception('problem with loading weather api');
    }
  }

  static Future<List<WeatherServices>> daytimeWeatherService(
      {String name = "", String day = ""}) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=bffe3aa195984a049f4151850212609&q=$name&$day&aqi=yes&alerts=yes&lang=ru');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<WeatherServices> data =
          (jsonData['list'] as List<dynamic>).map((item) {
        return WeatherServices.fromJson(item);
      }).toList();

      return data;
    } else {
      throw Exception('problem with loading weather api');
    }
  }

  static Future<WeatherServices>? weatherData(
      {String? cityWeather = "Kazan"}) async {
    http.Response response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$key&q=$cityWeather&aqi=no&lang=ru'),
    );
    var results = jsonDecode(response.body);
    var data = WeatherServices.fromJson(results);
    return data;
  }
}
