import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/settings_page.dart';
import 'pages/info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Monitoring Kolam',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue.shade600,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.black,
          primaryContainer: Colors.black,
          onPrimaryContainer: Colors.white,
        ),
        cardColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900, // Warna latar AppBar saat dark mode
          foregroundColor: Colors.white,         // Warna teks dan ikon
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade800,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(toggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/detail': (context) => DetailPage(),
        '/settings': (context) => SettingsPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}
