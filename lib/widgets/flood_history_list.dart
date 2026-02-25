import 'package:flutter/material.dart';
import '../models/flood_record.dart';

class FloodHistoryList extends StatelessWidget {
  final List<FloodRecord> records;

  const FloodHistoryList({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        final r = records[index];
        return ListTile(
          leading: Icon(
            Icons.water,
            color: r.flooded ? Colors.red : Colors.green,
          ),
          title: Text(r.location),
          subtitle: Text(
            "${r.date.year} • Rainfall: ${r.rainfall}mm • River: ${r.riverLevel}m",
          ),
        );
      },
    );
  }
}
