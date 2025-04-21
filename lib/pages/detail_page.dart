
import 'package:flutter/material.dart';
import '../widgets/sensor_card.dart';
import '../widgets/bottom_nav.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String kolamName = ModalRoute.of(context)?.settings.arguments as String? ?? "Kolam";

    return Scaffold(
      appBar: AppBar(title: Text(kolamName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SensorCard(icon: Icons.thermostat, label: "suhu", value: "27.5 °C"),
          SensorCard(icon: Icons.opacity, label: "DO", value: "6.8 mg/L"),
          SensorCard(icon: Icons.water_drop, label: "pH", value: "7.2"),
          SensorCard(icon: Icons.scale, label: "Pakan", value: "120 g"),
          SensorCard(icon: Icons.waves, label: "Tinggi Air", value: "45 cm"),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
