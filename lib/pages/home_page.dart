import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDark;

  const HomePage({required this.toggleTheme, required this.isDark, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark; // <--- Tambahin ini

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Monitoring Kolam'),
        actions: [
          Switch(
            value: isDark,
            onChanged: toggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(40),
                backgroundColor: isDarkMode
                    ? Colors.grey.shade300 // warna abu muda untuk dark mode
                    : Colors.lightBlue.shade100,
                // warna biru muda untuk light mode
                foregroundColor: Colors.black,
                // warna teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                shadowColor: Colors.black26,
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/detail', arguments: 'Kolam ${index + 1}');
              },
              child: Text('KOLAM ${index + 1}'),
            ),
          );
        }),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}