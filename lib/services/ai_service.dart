import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  GenerativeModel get _model {
    final apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";

    // FIX: Changed gemini-2.5-flash-latest to gemini-1.5-flash
    return GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);
  }

  Future<String> predictFloodRisk({
    required double rainfall,
    required double riverLevel,
    required String location,
    required String month,
  }) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      return "Error: API Key not found in .env file";
    }

    final prompt =
        '''
      You are acting as a Malaysia Flood Expert (JPS/NADMA specialist). 
      Analyze the following hyperlocal data:
      
      - Location: $location
      - Month: $month (consider monsoon patterns)
      - Rainfall: ${rainfall}mm
      - River Level: ${riverLevel}m

      Please provide a response in the following format:
      1. Classify Risk: (LOW, MEDIUM, or HIGH)
      2. Actionable Advice: Give 1 sentence of specific advice for residents.
      3. Evacuation: If risk is HIGH, suggest the general safety direction for $location.
    ''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      return response.text ??
          "AI was unable to generate a response. Please try again.";
    } catch (e) {
      print("Gemini Error: $e");
      return "Error: Failed to connect to Gemini. Check your API key and Internet.";
    }
  }

  /// Lists all available models for the current API key.
  /// Call this method to debug which models are accessible.
  Future<void> listAvailableModels() async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      debugPrint("Error: API Key not found in .env file");
      return;
    }

    try {
      final request = await HttpClient().getUrl(Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey'));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      debugPrint("--- Available Gemini Models ---\n$body");
    } catch (e) {
      debugPrint("Error listing models: $e");
    }
  }
}
