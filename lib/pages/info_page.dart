
import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info Aplikasi')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("Aplikasi monitoring kolamVersi 1.0.0\n"
            "\n"
            "DI BUAT OLEH KELOMPOK 1\n"
            "- Angga\n"
            "- Anisa\n"
            "- Ariq"),
          // textAlign: TextAlign.center,
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
