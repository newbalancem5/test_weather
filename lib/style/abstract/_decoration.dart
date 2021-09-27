import 'package:flutter/material.dart';

abstract class ContainerDecoration {
  static BoxDecoration containerRadius = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration containerSecondRadius = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration containerThreeRadius = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration customconntainerdecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 1),
        ),
      ]);
}
