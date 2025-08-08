import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meme_app/models/meme_model.dart';
import 'package:http/http.dart' as http;

class MemeService {
  static Future<List<Meme>?> fetchMemes(BuildContext context) async {
    final url = Uri.parse('https://meme-api.com/gimme/wholesomememes/50');
    try {
      final responce = await http.get(url);
      if (responce.statusCode == 200) {
        final data = json.decode(responce.body);
        final memes = (data['memes'] as List)
            .map((meme) => Meme.fromJson(meme))
            .toList();
        return memes;
      } else {
        throw Exception('Failed to Load Memes');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error to load memes')));

      return null;
    }
  }
}
