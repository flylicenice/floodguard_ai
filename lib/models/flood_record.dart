class FloodRecord {
  final String location;
  final double lat;
  final double lng;
  final double rainfall;
  final double riverLevel;
  final bool flooded;
  final DateTime date;

  FloodRecord({
    required this.location,
    required this.lat,
    required this.lng,
    required this.rainfall,
    required this.riverLevel,
    required this.flooded,
    required this.date,
  });

  factory FloodRecord.fromMap(Map<String, dynamic> data) {
    return FloodRecord(
      location: data['location'],
      lat: data['lat'],
      lng: data['lng'],
      rainfall: data['rainfall_mm'].toDouble(),
      riverLevel: data['river_level_m'].toDouble(),
      flooded: data['flooded'],
      date: DateTime.parse(data['date']),
    );
  }
}
