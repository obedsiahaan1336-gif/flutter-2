import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  // PENJELASAN: sex menyimpan nilai radio yang sedang terpilih di seluruh
  // grup (dipakai sebagai groupValue). Nilai awal 'male' membuat radio Male
  // sudah terpilih saat halaman dibuka. Tipe String? (nullable) mengikuti
  // tipe parameter onChanged milik Radio.
  String? sex = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gender Selection Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Gender: '),
            const SizedBox(width: 8),
            Row(
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: sex,
                  onChanged: (String? val) {
                    setState(() {
                      // PENJELASAN: val adalah value radio yang baru diklik
                      // ('male'). Nilainya disimpan ke sex sehingga groupValue
                      // berubah. Radio hanya tampil terpilih jika value-nya
                      // sama dengan groupValue, jadi radio lain otomatis
                      // tidak terpilih (hanya satu opsi yang bisa aktif).
                      sex = val;
                    });
                  },
                ),
                const Text('Male'),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                Radio<String>(
                  value: 'female',
                  groupValue: sex,
                  onChanged: (String? val) {
                    setState(() {
                      // PENJELASAN: sama seperti radio Male, di sini val
                      // bernilai 'female'. Dengan sex = 'female', radio
                      // Female terpilih dan radio Male menjadi tidak
                      // terpilih, lalu setState() menggambar ulang tampilan.
                      sex = val;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
