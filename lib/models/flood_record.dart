import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory FloodRecord.fromMap(Map<String, dynamic> map) {
    try{
      DateTime parsedDate;
    var dateValue = map['date'];

    if (dateValue is Timestamp) {
      parsedDate = dateValue.toDate();
    } else if (dateValue is String) {
      parsedDate = DateTime.parse(dateValue);
    } else {
      parsedDate = DateTime.now();
    }

    return FloodRecord(
      location: map['location'] as String? ?? 'Unknown Location',
      lat: (map['lat'] as num).toDouble(),
      lng: (map['lng'] as num).toDouble(),
      flooded: map['flooded'] ?? false,
      date: parsedDate,
      rainfall: (map['rainfall_mm'] as num?)?.toDouble() ?? 0.0,
      riverLevel: (map['river_level_m'] as num?)?.toDouble() ?? 0.0,
    );
    } catch (e) {
      print ("Error parsing a single FloodRecord: $e");
      rethrow;
    }
  }
}
