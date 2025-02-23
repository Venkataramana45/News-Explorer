import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String apiKey = 'a3cf621540e84398a982d5fb08af6b55';
  static const String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http
        .get(Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<List<Article>> fetchCategoryNews(String category) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load category news');
    }
  }
}
