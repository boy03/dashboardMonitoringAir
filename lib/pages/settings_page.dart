import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../services/mqtt_service.dart';
import 'package:mqtt_client/mqtt_client.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController brokerController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController clientIdController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan MQTT')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: brokerController,
                decoration: const InputDecoration(labelText: 'Broker URL'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: portController,
                decoration: const InputDecoration(labelText: 'Port'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: clientIdController,
                decoration: const InputDecoration(labelText: 'Client ID'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: usernameController,
                decoration:
                const InputDecoration(labelText: 'Username (opsional)'),
              ),
              TextFormField(
                controller: passwordController,
                decoration:
                const InputDecoration(labelText: 'Password (opsional)'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final mqtt = MqttService();

                    try {
                      await mqtt.connect(
                        broker: brokerController.text,
                        port: int.tryParse(portController.text) ?? 1883,
                        clientId: clientIdController.text,
                        username: usernameController.text,
                        password: passwordController.text,
                      );

                      final state = mqtt.client.connectionStatus?.state;
                      if (state == MqttConnectionState.connected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Berhasil terhubung ke MQTT')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Gagal terhubung. Status: $state')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  }
                },
                child: const Text('Simpan & Hubungkan'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
