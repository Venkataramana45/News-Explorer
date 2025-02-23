import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/news_bloc.dart';
import '../blocs/news_event.dart';
import '../blocs/news_state.dart';
import '../models/article.dart';
import '../widgets/news_card.dart';
import 'news_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "General News",
          style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            // Trigger the event when the screen loads
            if (state is NewsInitial) {
              context.read<NewsBloc>().add(FetchTopHeadlines());
            }
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is NewsLoaded) {
              final articles = state.articles;
              if (articles.isEmpty) {
                return const Center(child: Text('No News Articles.'));
              }
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return NewsCard(
                    article: article,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailScreen(article: article),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
