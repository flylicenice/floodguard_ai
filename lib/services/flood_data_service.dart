import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flood_record.dart';

class FloodDataService {
  final _db = FirebaseFirestore.instance;

  Future<List<FloodRecord>> getFloodHistory() async {
    try {
      // Ensure this name matches your Firebase Collection exactly
      final snapshot = await _db.collection('flood_history').get(); 
      
      print("Raw documents found: ${snapshot.docs.length}"); 

      return snapshot.docs.map((doc) {
        return FloodRecord.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }
}