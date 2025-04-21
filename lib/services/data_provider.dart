
import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../models/sensor_data.dart';

typedef OnMessageCallback = void Function(String topic, SensorData data);

class MqttService {
  final String broker;
  final String clientId;
  final List<String> topics;
  final OnMessageCallback onMessage;

  late MqttServerClient client;

  MqttService({
    required this.broker,
    required this.clientId,
    required this.topics,
    required this.onMessage,
  });

  Future<void> connect() async {
    client = MqttServerClient(broker, clientId);
    client.logging(on: false);
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;

    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } catch (e) {
      client.disconnect();
      return;
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      for (var topic in topics) {
        client.subscribe(topic, MqttQos.atLeastOnce);
      }

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final recMess = c[0].payload as MqttPublishMessage;
        final message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        try {
          final data = SensorData.fromJson(jsonDecode(message));
          onMessage(c[0].topic, data);
        } catch (e) {
          print("Error parsing message: $e");
        }
      });
    } else {
      client.disconnect();
    }
  }

  void onDisconnected() {
    print('Disconnected from MQTT');
  }

  void disconnect() {
    client.disconnect();
  }
}
