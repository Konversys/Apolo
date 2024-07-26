class CurrentTrip {
  CurrentTrip({
    required this.name,
    required this.gasolineCoastRub,
  });

  void updateParameters(double gasolineConsumptionPer1km, double distanceKm,
      double gasolineConsumedRub) {
    _gasolineConsumptionPer1km = gasolineConsumptionPer1km;
    _distanceKm = distanceKm;
    _gasolineConsumedRub = gasolineConsumedRub;
  }

  bool isTripStarted = false;
  String name;
  double gasolineCoastRub;

  final DateTime _dateStart = DateTime.now();

  DateTime get dateStart => _dateStart;

  double get gasolineConsumptionPer100km => gasolineConsumptionPer1km * 100;

  double _gasolineConsumptionPer1km = 0;

  double get gasolineConsumptionPer1km => _gasolineConsumptionPer1km;

  double _distanceKm = 0;

  double get distanceKm => _distanceKm;

  double _gasolineConsumedRub = 0;

  double get gasolineConsumedRub => _gasolineConsumedRub;
}
