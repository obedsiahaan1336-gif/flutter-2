import 'package:flutter/material.dart';
import 'navigation_pop.dart';

class NavigationPush extends StatefulWidget {
  const NavigationPush({super.key});

  @override
  State<NavigationPush> createState() => _NavigationPushState();
}

class _NavigationPushState extends State<NavigationPush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Push"),
      ),
      body: Container(
        // PENJELASAN: padding EdgeInsets.all(10.0) memberi jarak 10 logical
        // pixel di keempat sisi (atas, bawah, kiri, kanan) antara tepi
        // Container dan isinya (Column). Gunanya agar tombol tidak menempel
        // langsung ke tepi layar.
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NavigationPop();
                }));
              },
              child: const Text('go to next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
