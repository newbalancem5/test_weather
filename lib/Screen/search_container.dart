import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_weather/Screen/screens.dart';
import 'package:test_weather/const/_const.dart';
import 'package:test_weather/services/weatherapi.dart';
import 'package:test_weather/style/helpers/_size.dart';

class Searchcontainer extends StatefulWidget {
  const Searchcontainer({Key? key}) : super(key: key);

  @override
  _SearchcontainerState createState() => _SearchcontainerState();
}

final services = HttpWeatherServices();

class _SearchcontainerState extends State<Searchcontainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: [
              SizedBox(
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
              ElevatedButton(
                onPressed: () {
                  if (city != null) {
                    data = HttpWeatherServices.currentWeatherService(
                        name: "$city");
                    setState(() {});
                  }
                },
                child: Text(search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
