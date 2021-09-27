import 'package:flutter/material.dart';
import 'package:test_weather/const/_const.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Text(errortext),
      ),
    );
  }
}
