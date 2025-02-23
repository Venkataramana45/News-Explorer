import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/home.dart';
import 'blocs/news_bloc.dart';
import 'services/news_services.dart';

void main() {
  runApp(NewsExplorerApp());
}

class NewsExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        BlocProvider(create: (_) => NewsBloc(NewsService())),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'News Explorer',
            theme: themeProvider.isDarkMode
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        },
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
