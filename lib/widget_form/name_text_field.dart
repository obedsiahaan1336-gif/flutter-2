import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // PENJELASAN: dispose() dipanggil Flutter saat widget dihapus dari layar.
    // TextEditingController memegang resource (memori dan listener), jadi
    // harus dilepas manual dengan dispose() agar tidak terjadi memory leak.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLength: 20, // Batas maksimal karakter input
          decoration: const InputDecoration(
            labelText: 'Name',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey, // Warna underline blueGrey
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                // PENJELASAN: focusedBorder adalah border yang dipakai saat
                // TextField sedang fokus (kursor aktif / sedang diketik).
                // Jika tidak diatur, saat fokus warna garis berubah mengikuti
                // warna tema (primary). Dengan blueGrey, garis tetap sama
                // saat fokus maupun tidak.
                color: Colors.blueGrey,
              ),
            ),
          ),
          onChanged: (text) {
            // PENJELASAN: onChanged dipanggil setiap isi teks berubah (tiap
            // huruf diketik atau dihapus) dan menerima teks terbaru. debugPrint
            // mencetak ke Debug Console (bukan ke layar aplikasi), dan
            // '$text' adalah string interpolation yang menyisipkan isi teks.
            debugPrint('Text changed: $text');
          },
        ),
      ),
    );
  }
}
