import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.callback,
    required this.tooltip,
  });

  final VoidCallback callback;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF0D47A1),
      onPressed: callback,
      child: const Icon(Icons.add),
      tooltip: tooltip,
    );
  }
}
