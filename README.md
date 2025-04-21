# 🐟 Smart Kolam - Monitoring IoT Tambak Ikan Berbasis Flutter
Aplikasi Smart Kolam adalah solusi monitoring tambak ikan berbasis IoT dan Flutter. Aplikasi ini menampilkan data real-time dari berbagai sensor yang terhubung melalui protokol MQTT.

📱 Fitur Aplikasi
🔌 Koneksi ke broker MQTT untuk komunikasi real-time

📶 Monitoring 3 kolam sekaligus

# 🌡️ Data sensor yang ditampilkan:

- Suhu air
- DO (Dissolved Oxygen)
- pH air
- Jumlah pakan
- Tinggi air
- 🌓 Mode tampilan terang dan gelap (light & dark mode)
- 🔄 Update otomatis saat data baru diterima
- ⚙️ Pengaturan koneksi dan topik MQTT

# 🧠 Teknologi yang Digunakan

- Flutter (Frontend Mobile)
- MQTT (mqtt_client.dart) untuk komunikasi IoT
- ESP32 / Arduino / Sensor IoT (dari perangkat luar, sebagai publisher MQTT)
- JSON Parsing untuk data sensor

# 🛠️ Cara Menjalankan

- Clone repositori ini
- Jalankan flutter pub get
- Pastikan perangkat IoT kamu sudah terhubung ke broker MQTT
- Ubah konfigurasi broker di file mqtt_service.dart
- Jalankan di emulator atau perangkat Android/iOS

# 🤝 Kontribusi
Pull Request sangat terbuka untuk fitur baru, perbaikan bug, atau dokumentasi tambahan.

# 📄 Lisensi
Proyek ini menggunakan lisensi MIT.

# 📷 Tampilan Antarmuka
# Light mode
![image](https://github.com/user-attachments/assets/06e4c4a6-1066-4de3-8bca-4f2c8a68310b)
![image](https://github.com/user-attachments/assets/76214a61-4409-4128-a500-25c69daa49fc)
![image](https://github.com/user-attachments/assets/97740b3e-c2e4-4d34-9600-0ad43e6d566c)

# Dark mode
![image](https://github.com/user-attachments/assets/b3ceecf2-9efc-41b7-923c-deec94433ebe)
![image](https://github.com/user-attachments/assets/d7053403-d8b4-4b83-9bb7-b3adc2daf816)
![image](https://github.com/user-attachments/assets/5e3a1f36-be0e-4d78-8a12-a4213b3e1b4e)

