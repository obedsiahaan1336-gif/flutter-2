import 'package:flutter/material.dart';

class FavoriteLanguageDropdown extends StatefulWidget {
  const FavoriteLanguageDropdown({super.key});

  @override
  State<FavoriteLanguageDropdown> createState() =>
      _FavoriteLanguageDropdownState();
}

class _FavoriteLanguageDropdownState extends State<FavoriteLanguageDropdown> {
  // PENJELASAN: selectedLanguage menyimpan item yang sedang dipilih. Tipenya
  // String? (nullable) karena onChanged milik DropdownButton memberi String?.
  // Nilai awal 'Dart' membuat dropdown langsung menampilkan Dart saat pertama
  // dibuka. Nilai awal harus salah satu isi list languages, kalau tidak
  // Flutter akan melempar error.
  String? selectedLanguage = 'Dart';
  List<String> languages = ['Dart', 'Python', 'JavaScript', 'Kotlin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your favorite language: '),
            const SizedBox(width: 10),
            DropdownButton<String>(
              // PENJELASAN: value adalah item yang ditampilkan pada tombol
              // dropdown saat ini. DropdownButton tidak menyimpan pilihan
              // sendiri; ia hanya menampilkan value. Saat pengguna memilih
              // item baru, onChanged mengubah selectedLanguage lewat setState
              // sehingga tampilan digambar ulang.
              value: selectedLanguage,
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
