import 'package:flutter/material.dart';

class InstagramConnectSwitch extends StatefulWidget {
  const InstagramConnectSwitch({super.key});

  @override
  State<InstagramConnectSwitch> createState() =>
      _InstagramConnectSwitchState();
}

class _InstagramConnectSwitchState extends State<InstagramConnectSwitch> {
  // PENJELASAN: isOn adalah state yang menyimpan status switch. false berarti
  // posisi awal switch adalah OFF (mati). true berarti ON (menyala).
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram Connect Switch Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Connect Instagram'),
            const SizedBox(width: 8),
            Switch(
              // PENJELASAN: value menentukan tampilan switch (true = ON,
              // false = OFF). Switch tidak mengingat statusnya sendiri, ia
              // hanya mengikuti nilai isOn.
              value: isOn,
              onChanged: (bool val) {
                setState(() {
                  // PENJELASAN: val adalah nilai baru (true/false) setelah
                  // pengguna menggeser switch. Nilainya disimpan ke isOn di
                  // dalam setState() supaya Flutter menjalankan build() lagi
                  // dan switch digambar ulang sesuai nilai yang baru.
                  isOn = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
