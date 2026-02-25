import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/ai_service.dart';

class TrendsService {
  Future<Map<String, int>> getMonthlyTrends() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('flood_history')
          .get();

      Map<String, int> counts = {};

      for (var doc in snapshot.docs) {
        final data = doc.data();
        // Safety check: ensure 'flooded' and 'date' exist
        if (data.containsKey('flooded') &&
            data['flooded'] == true &&
            data.containsKey('date')) {
          DateTime date;
          var dateValue = data['date'];

          // Handle if date is Firestore Timestamp or String
          if (dateValue is Timestamp) {
            date = dateValue.toDate();
          } else {
            date = DateTime.parse(dateValue.toString());
          }

          String month = _monthName(date.month);
          counts[month] = (counts[month] ?? 0) + 1;
        }
      }
      return counts;
    } catch (e) {
      print("Error fetching trends: $e");
      return {}; // Return empty map so UI can show "No Data" instead of circle
    }
  }

  Future<String> getAISummaryForMonth(
    String monthName,
    List<Map<String, dynamic>> records,
  ) async {
    if (records.isEmpty) return "No flood records found for $monthName.";

    final ai = AIService();
    try {
      // Create a small data snippet for the AI
      String context = records
          .take(3)
          .map((r) => "${r['location']} (${r['rainfall_mm']}mm)")
          .join(", ");

      return await ai.predictFloodRisk(
        location: "Historical points including $context",
        rainfall: 0,
        riverLevel: 0,
        month: monthName,
      );
    } catch (e) {
      return "Climate analysis currently unavailable.";
    }
  }

  Future<List<Map<String, dynamic>>> getDetailsForMonth(
    String monthName,
  ) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('flood_history')
        .get();
    List<Map<String, dynamic>> monthlyRecords = [];

    for (var doc in snapshot.docs) {
      final data = doc.data();
      if (!data.containsKey('date')) continue;

      DateTime date;
      var dateValue = data['date'];
      if (dateValue is Timestamp) {
        date = dateValue.toDate();
      } else {
        date = DateTime.parse(dateValue.toString());
      }

      if (_monthName(date.month) == monthName) {
        monthlyRecords.add(data);
      }
    }
    return monthlyRecords;
  }

  String _monthName(int m) => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ][m - 1];
}
