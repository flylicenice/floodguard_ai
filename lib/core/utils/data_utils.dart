// lib/core/utils/data_utils.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUtils {
  static Future<void> seedFloodData() async {
    final db = FirebaseFirestore.instance;
    final collection = db.collection('flood_history');

    final List<Map<String, dynamic>> records = [
      // --- KUALA LUMPUR / SELANGOR (Flash Floods) ---
      {
        'location': 'Hulu Langat, Selangor',
        'lat': 3.1132,
        'lng': 101.8213,
        'rainfall_mm': 380.0,
        'river_level_m': 6.5,
        'flooded': true,
        'date': '2021-12-18T18:00:00Z',
      },
      {
        'location': 'Masjid Jamek, KL',
        'lat': 3.1493, 'lng': 101.6963,
        'rainfall_mm': 150.0, 'river_level_m': 31.5, // River station height
        'flooded': true, 'date': '2022-03-07T15:30:00Z',
      },
      {
        'location': 'Sri Muda, Shah Alam',
        'lat': 3.0336,
        'lng': 101.5422,
        'rainfall_mm': 320.0,
        'river_level_m': 5.8,
        'flooded': true,
        'date': '2021-12-19T02:00:00Z',
      },

      // --- KELANTAN / TERENGGANU (Monsoon Floods) ---
      {
        'location': 'Kuala Krai, Kelantan',
        'lat': 5.5292,
        'lng': 102.2014,
        'rainfall_mm': 420.0,
        'river_level_m': 25.8,
        'flooded': true,
        'date': '2023-12-24T09:00:00Z',
      },
      {
        'location': 'Dungun, Terengganu',
        'lat': 4.7406,
        'lng': 103.4111,
        'rainfall_mm': 280.0,
        'river_level_m': 21.5,
        'flooded': true,
        'date': '2024-01-05T12:00:00Z',
      },
      {
        'location': 'Pasir Puteh, Kelantan',
        'lat': 5.8347,
        'lng': 102.4053,
        'rainfall_mm': 60.0,
        'river_level_m': 1.5,
        'flooded': false,
        'date': '2024-06-15T10:00:00Z',
      },

      // --- JOHOR / PAHANG (River Overflows) ---
      {
        'location': 'Segamat, Johor',
        'lat': 2.5064,
        'lng': 102.8158,
        'rainfall_mm': 350.0,
        'river_level_m': 10.2,
        'flooded': true,
        'date': '2023-03-01T22:00:00Z',
      },
      {
        'location': 'Temerloh, Pahang',
        'lat': 3.4479,
        'lng': 102.4172,
        'rainfall_mm': 210.0,
        'river_level_m': 33.5,
        'flooded': true,
        'date': '2022-01-02T14:00:00Z',
      },

      // --- NORTHERN REGION ---
      {
        'location': 'Baling, Kedah',
        'lat': 5.6767,
        'lng': 100.9161,
        'rainfall_mm': 180.0,
        'river_level_m': 14.2,
        'flooded': true,
        'date': '2022-07-04T17:00:00Z',
      },

      // --- EAST MALAYSIA (Sarawak/Sabah) ---
      {
        'location': 'Baram, Sarawak',
        'lat': 3.9667,
        'lng': 114.3833,
        'rainfall_mm': 290.0,
        'river_level_m': 8.8,
        'flooded': true,
        'date': '2023-05-20T08:00:00Z',
      },
      {
        'location': 'Kota Kinabalu, Sabah',
        'lat': 5.9804,
        'lng': 116.0753,
        'rainfall_mm': 55.0,
        'river_level_m': 0.8,
        'flooded': false,
        'date': '2024-07-10T14:00:00Z',
      },

      // --- DRY SAMPLES (For AI Contrast) ---
      {
        'location': 'Cyberjaya, Selangor',
        'lat': 2.9213,
        'lng': 101.6559,
        'rainfall_mm': 12.0,
        'river_level_m': 0.5,
        'flooded': false,
        'date': '2024-08-01T12:00:00Z',
      },
    ];

    try {
      WriteBatch batch = db.batch();
      for (var data in records) {
        DocumentReference ref = collection.doc();
        batch.set(ref, data);
      }
      await batch.commit();
      print("Successfully seeded 12 additional records!");
    } catch (e) {
      print("Error during bulk upload: $e");
    }
  }
}
