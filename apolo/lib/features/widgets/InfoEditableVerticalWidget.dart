import 'package:flutter/material.dart';

class InfoEditableVerticalWidget extends StatelessWidget {
  final String value;
  final String description;

  final double? fontSizeValue;
  final double? fontSizeDescription;

  const InfoEditableVerticalWidget(
      {super.key,
      required this.value,
      required this.description,
      required this.fontSizeValue,
      required this.fontSizeDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Container(
            width: double.infinity,
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
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeValue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeDescription,
                  ),
                ),
              ],
            )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 15, 0),
                  child: IconButton(
                      onPressed: () {
                        _showAlertDialog(context, 'Введите наименование', 'Введите наименование');
                      },
                      icon: const Icon(
                        color: Colors.white,
                        Icons.edit_outlined,
                        size: 34,
                      )))
            ],
          ),
        )
      ]),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String hintText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ок'),
              onPressed: () {
                // Handle the submit action
              },
            ),
          ],
        );
      },
    );
  }
}