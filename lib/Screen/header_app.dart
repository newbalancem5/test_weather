import 'package:flutter/material.dart';
import 'package:test_weather/const/_const.dart';
import 'package:test_weather/style/abstract/_fontstyle.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        nameapp,
        style: FontStyleText.title,
      ),
    );
  }
}
