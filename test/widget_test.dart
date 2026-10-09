import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:w5s2/main.dart';

void main() {
  testWidgets('Menu page tampil dengan benar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('PAM W5S2 - Form & Navigation'), findsOneWidget);
    expect(find.text('Form'), findsOneWidget);
    expect(find.text('TextField'), findsOneWidget);
    expect(find.text('Dropdown'), findsOneWidget);
  });

  testWidgets('Menu TextField membuka halaman lalu bisa kembali',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Buka halaman TextField dari menu.
    await tester.tap(find.text('TextField'));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);

    // Kembali ke menu.
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('PAM W5S2 - Form & Navigation'), findsOneWidget);
  });

  testWidgets('Dropdown menampilkan Dart sebagai pilihan awal',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Dropdown'));
    await tester.pumpAndSettle();

    expect(find.text('Dart'), findsOneWidget);
  });

  testWidgets('Switch berubah dari off ke on saat ditekan',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Switch'));
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, false);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, true);
  });
}