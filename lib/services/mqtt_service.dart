import 'package:flutter/material.dart';
import '../models/sensor_data.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class DataProvider with ChangeNotifier {
  final Map<String, SensorData> _dataPerKolam = {};

  SensorData getData(String kolam) {
    return _dataPerKolam[kolam] ?? SensorData.empty();
  }

  void updateData(String kolam, SensorData newData) {
    _dataPerKolam[kolam] = newData;
    notifyListeners();
  }
}

// Tambahan: MQTT Client Class
class MqttService {
  late MqttServerClient client;

  Future<void> connect({
    required String broker,
    required int port,
    required String clientId,
    String? username,
    String? password,
  }) async {
    client = MqttServerClient(broker, clientId);
    client.port = port;
    client.secure = true;
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = _onDisconnected;

    var connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean();

    if (username != null && username.isNotEmpty) {
      connMessage = connMessage.authenticateAs(username, password);
    }

    client.connectionMessage = connMessage;

    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        debugPrint('✅MQTT Connected!');
      } else {
        debugPrint('❌MQTT Connection failed - status: ${client.connectionStatus}');
        client.disconnect();
      }
    } catch (e) {
      debugPrint('MQTT exception: $e');
      client.disconnect();
    }
  }

  void _onDisconnected() {
    debugPrint('MQTT Disconnected');
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atMostOnce);
  }
}
