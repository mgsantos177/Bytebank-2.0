import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {}

void push(BuildContext blocContent, BlocContainer container) {
  Navigator.of(blocContent).push(
    MaterialPageRoute(
      builder: (context) => container,
    ),
  );
}
