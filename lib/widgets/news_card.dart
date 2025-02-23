import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../models/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final String category;

  const NewsCard({
    required this.article,
    required this.onTap,
    this.category = 'General',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, style: TextStyle(fontSize: 13)),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: Text(
                          category.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        DateFormat('d MMMM yyyy')
                            .format(DateTime.parse(article.publishedAt)),
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
