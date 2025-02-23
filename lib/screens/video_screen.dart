import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Note: newsapi.org does not provide video content directly. This is a placeholder.
    // You may need to integrate another API (e.g., YouTube API) for video news.
    return Scaffold(
      appBar: AppBar(title: Text('Video News')),
      body: Center(
        child: Text(
          'Video news content coming soon!\n(Requires additional API integration)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
