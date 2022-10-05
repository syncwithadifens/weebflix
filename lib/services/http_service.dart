import 'dart:convert';

import 'package:weebflix/model/anime_model/anime_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const apiUrl = 'https://gogoanime.herokuapp.com';

  Future<List<AnimeModel>> getPopular() async {
    var response = await http.get(Uri.parse('$apiUrl/popular'));
    try {
      List parsedJson = json.decode(response.body);
      return parsedJson.map((e) => AnimeModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<AnimeModel>> getRecent() async {
    var response = await http.get(Uri.parse('$apiUrl/recent-release'));
    try {
      List parsedJson = json.decode(response.body);
      return parsedJson.map((e) => AnimeModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<AnimeModel>> getMovies() async {
    var response = await http.get(Uri.parse('$apiUrl/anime-movies'));
    try {
      List parsedJson = json.decode(response.body);
      return parsedJson.map((e) => AnimeModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
