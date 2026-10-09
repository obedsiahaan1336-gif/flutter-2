import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _selectedDate;

  // Function untuk menampilkan DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // PENJELASAN ekspresi pada Text di bawah:
            // - Jika _selectedDate masih null, tampilkan 'No date selected'.
            // - Jika sudah ada, '${...}' menyisipkan hasil ekspresi ke string.
            // - _selectedDate! : tanda "!" menegaskan nilainya tidak null
            //   (aman karena sudah dicek di kondisi ternary).
            // - .toLocal() : mengubah waktu ke zona waktu perangkat.
            // - .toString() : mengubah DateTime ke teks, misal
            //   '2026-10-09 00:00:00.000'.
            // - .split(' ') : memecah teks pada spasi menjadi list
            //   ['2026-10-09', '00:00:00.000'].
            // - [0] : mengambil elemen pertama, yaitu tanggalnya saja
            //   (tanpa jam).
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
