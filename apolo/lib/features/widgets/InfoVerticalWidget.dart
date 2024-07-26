import 'package:flutter/material.dart';

class InfoVerticalWidget extends StatelessWidget {
  final String value;
  final String description;

  final double? fontSizeValue;
  final double? fontSizeDescription;

  const InfoVerticalWidget(
      {super.key,
      required this.value,
      required this.description,
      required this.fontSizeValue,
      required this.fontSizeDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style:
                      TextStyle(color: Colors.white, fontSize: fontSizeValue, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeDescription,
                      ),
                ),
              ],
            )));
  }
}
