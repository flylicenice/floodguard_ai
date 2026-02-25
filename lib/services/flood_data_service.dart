import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flood_record.dart';

class FloodDataService {
  final _db = FirebaseFirestore.instance;

  Future<List<FloodRecord>> getFloodHistory() async {
    final snapshot = await _db.collection('flood_history').get();

    return snapshot.docs.map((doc) => FloodRecord.fromMap(doc.data())).toList();
  }
}
