import 'package:flutter/material.dart';
import 'package:news_explorer/screens/home_screen.dart';
import 'category_screen.dart';
import 'video_screen.dart';
import 'profile_screen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _selectedindex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    VideoScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline_rounded,
              ),
              label: 'Videos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_rounded,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedindex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
