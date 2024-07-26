import '../models/CurrentTrip.dart';

class TripRepository {
  Future<void> saveCurrentTripAsync() async {}

  Future<CurrentTrip> getCurrentTripAsync() async {
    CurrentTrip currentTrip =
        CurrentTrip(name: "Барнаул-Горный", gasolineCoastRub: 52);

    currentTrip.updateParameters(0.7454, 128.53, 1283.53);

    return currentTrip;
  }
}
