import 'dart:async';

import 'package:apolo/models/CurrentTrip.dart';
import 'package:apolo/repositories/TripRepository.dart';
import 'package:flutter/cupertino.dart';

class CurrentTripViewModel extends ChangeNotifier {
  late Timer timer;

  CurrentTripViewModel() {
    timer = Timer.periodic(const Duration(seconds: 1), handleTimer);
  }

  final _tripRepository = TripRepository();
  CurrentTrip currentTrip = CurrentTrip(name: '', gasolineCoastRub: 0);

  String get tripToggleName => currentTrip.isTripStarted ? "Завершить поездку" : "Начать поездку";
  Duration get tripDuration => DateTime.now().difference(currentTrip.dateStart);

  Future<void> fetchCurrentTripData() async {
    currentTrip = await _tripRepository.getCurrentTripAsync();
    notifyListeners();
  }

  Future<void> toggleTrip() async {
    if (currentTrip.isTripStarted) {
      stopTrip();
    } else {
      startTrip();
    }
  }

  Future<void> startTrip() async {
    currentTrip = await _tripRepository.getCurrentTripAsync();
    currentTrip.isTripStarted = true;
    notifyListeners();
  }

  Future<void> stopTrip() async {
    currentTrip.isTripStarted = false;
    notifyListeners();
  }

  void handleTimer(Timer timer) {
    if (currentTrip.isTripStarted) {
      notifyListeners();
    }
  }
}
