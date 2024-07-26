import 'package:apolo/features/current_trip/CurrentTripViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/InfoEditableVerticalWidget.dart';
import '../widgets/InfoVerticalWidget.dart';

class CurrentTripScreen extends StatefulWidget {
  const CurrentTripScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CurrentTripScreen();
}

class _CurrentTripScreen extends State<CurrentTripScreen> {
  CurrentTripViewModel viewModel = CurrentTripViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      viewModel.fetchCurrentTripData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentTripViewModel>(
        create: (context) => viewModel,
        child: Consumer<CurrentTripViewModel>(builder: (context, vm, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  InfoEditableVerticalWidget(
                      value: vm.currentTrip.name,
                      description: 'Наименование',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                ],
              ),
              const Row(
                children: [
                  InfoEditableVerticalWidget(
                      value: '52.72',
                      description: 'Цена за 1л бензина, руб',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                ],
              ),
              Row(
                children: [
                  InfoVerticalWidget(
                      value: DateFormat('dd.MM.yyyy HH:ss').format(vm.currentTrip.dateStart),
                      description: 'Начало',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                  InfoVerticalWidget(
                      value: vm.tripDuration.toString().split('.').first.padLeft(8, "0"),
                      description: 'Длительность',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoVerticalWidget(
                      value: NumberFormat('####0.00').format(vm.currentTrip.gasolineConsumptionPer100km),
                      description: 'Расход на 100 км, л',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                  InfoVerticalWidget(
                      value: NumberFormat('####0.00').format(vm.currentTrip.distanceKm),
                      description: 'Дистанция, км',
                      fontSizeValue: 26,
                      fontSizeDescription: 22),
                ],
              ),
              const Row(
                children: [
                  InfoVerticalWidget(
                      value: '3459.23',
                      description: 'Стоимость поездки, руб',
                      fontSizeValue: 26,
                      fontSizeDescription: 26),
                ],
              ),
              Container(
                width: 300,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: vm.currentTrip.isTripStarted ? Icon(Icons.stop_circle_rounded, color: Colors.white) : Icon(Icons.play_circle_fill, color: Colors.white),
                  onPressed: () {
                    vm.toggleTrip();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  label: Text(
                    vm.tripToggleName,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
