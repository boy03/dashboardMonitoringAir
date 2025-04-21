
class SensorData {
  final double suhu;
  final double doValue;
  final double ph;
  final double pakan;
  final double tinggi;

  SensorData({
    required this.suhu,
    required this.doValue,
    required this.ph,
    required this.pakan,
    required this.tinggi,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      suhu: (json['suhu'] ?? 0).toDouble(),
      doValue: (json['do'] ?? 0).toDouble(),
      ph: (json['ph'] ?? 0).toDouble(),
      pakan: (json['pakan'] ?? 0).toDouble(),
      tinggi: (json['tinggi'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'suhu': suhu,
    'do': doValue,
    'ph': ph,
    'pakan': pakan,
    'tinggi': tinggi,
  };

  factory SensorData.empty() {
    return SensorData(suhu: 0, doValue: 0, ph: 0, pakan: 0, tinggi: 0);
  }

  @override
  String toString() {
    return 'SensorData(suhu: \$suhu, do: \$doValue, ph: \$ph, pakan: \$pakan, tinggi: \$tinggi)';
  }
}
