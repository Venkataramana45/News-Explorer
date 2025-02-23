import 'package:flutter/material.dart';

import '../models/article.dart';
import '../services/news_services.dart';
import '../widgets/news_card.dart';
import 'news_details_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    'Tech',
    'Economy',
    'Sports',
    'Health',
    'Fun',
    'Science',
    'General',
    'Music',
    'Art'
  ];
  List<String> filteredCategories = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  final Map<String, String> categoryImages = {
    'Tech':
        'https://th.bing.com/th/id/R.37670159cb7a433f574a02d27b940aee?rik=qXqwN5T3MhInWQ&riu=http%3a%2f%2fres-3.cloudinary.com%2ffieldfisher%2fimage%2fupload%2ff_jpg%2cq_auto%2fv1%2fsectors%2ftechnology%2ftech_neoncircuitboard_857021704_medium_lc5h05&ehk=nISAWBDhFyyZ%2bAydAC2uE2%2bcZiYyVp5BvMgXY5JCFFk%3d&risl=&pid=ImgRaw&r=0',
    'Economy':
        'https://th.bing.com/th/id/OIP._-i3TYL09Yg3A9OzwO0bWwHaE8?w=248&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'Sports':
        'https://cdn.abcotvs.com/dip/images/12721210_2023-wabc-NewApp-SPORTS.jpg',
    'Health':
        'https://api.time.com/wp-content/uploads/2024/08/7-health-metrics.gif',
    'Fun':
        'https://static.honeykidsasia.com/wp-content/uploads/2024/03/Resizing-14.jpg',
    'Science':
        'https://static.vecteezy.com/system/resources/previews/022/006/618/large_2x/science-background-illustration-scientific-design-flasks-glass-and-chemistry-physics-elements-generative-ai-photo.jpeg',
    'General':
        'https://th.bing.com/th/id/R.3a9f0210ff7d1e83039ff237c81bacae?rik=asArcL6qvWfZfA&riu=http%3a%2f%2fs1.picswalls.com%2fwallpapers%2f2016%2f03%2f29%2fbeautiful-nature-high-definition_042323787_304.jpg&ehk=8tO7UxFL%2bC03x6vfc2O9EhdUCe4fl6tC7UGUdlnpdX4%3d&risl=&pid=ImgRaw&r=0',
    'Music':
        'https://th.bing.com/th/id/OIP.K4OWmnwrMCE-BHbsjhbe2QHaE8?rs=1&pid=ImgDetMain',
    'Art':
        'https://miro.medium.com/v2/resize:fit:956/1*BoIwK3flsWLkT57s18Bpgg.png',
  };

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;
  }

  void _searchCategory(String query) {
    final results = categories.where((category) {
      return category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News Categories',
          style: TextStyle(color: Colors.deepPurple),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  filteredCategories = categories;
                }
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: _isSearching
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    curve: Curves.easeInOut,
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              filteredCategories = categories;
                            });
                          },
                        ),
                      ),
                      onChanged: _searchCategory,
                    ),
                  ),
                )
              : Container(),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 1,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final category = filteredCategories[index];
          final imageUrl =
              categoryImages[category]!; // Get the image URL for the category

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryNewsScreen(category: category),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 5.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl), // Set the background image
                      fit: BoxFit
                          .cover, // Make the image cover the entire container
                    ),
                  ),
                  child: Center(
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryNewsScreen extends StatefulWidget {
  final String category;

  const CategoryNewsScreen({required this.category});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = NewsService().fetchCategoryNews(widget.category.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} News'.toUpperCase(),
          style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No News Articles.'),
            );
          } else {
            final articles = snapshot.data!;
            return SingleChildScrollView(
              // Make the entire screen scrollable
              child: Column(
                children: [
                  // The header with the first article's image and title
                  Container(
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(articles[0].urlToImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: double.maxFinite,
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 10),
                            child: Center(
                              child: Text(
                                articles[0].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ListView inside the scrollable Column
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      shrinkWrap: true, // To prevent overflow
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return NewsCard(
                          article: article,
                          category: widget.category,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailScreen(article: article),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
