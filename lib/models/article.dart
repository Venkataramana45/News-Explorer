class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String source;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.source,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://static.vecteezy.com/system/resources/previews/000/186/101/original/news-alert-concept-graphic-design-for-tv-news-channels-vector.jpg',
      source: json['source']['name'] ?? 'Unknown Source',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
