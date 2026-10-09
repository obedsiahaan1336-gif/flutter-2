import 'package:flutter/material.dart';
import '../widget_form/agree_term_widget.dart';
import '../widget_form/date_picker_page.dart';
import '../widget_form/dialog_widget.dart';
import '../widget_form/favorite_language_dropdown.dart';
import '../widget_form/gender_selection.dart';
import '../widget_form/instagram_connect_switch.dart';
import '../widget_form/name_text_field.dart';
import '../widget_navigation/bottom_navbar_widget.dart';
import '../widget_navigation/drawer_widget.dart';
import '../widget_navigation/navigation_push.dart';
import '../widget_navigation/sliver_widget.dart';
import '../widget_navigation/tabbar_widget.dart';
// PENJELASAN "../":
// File ini berada di lib/pages/, sedangkan folder widget_form/ dan
// widget_navigation/ berada di lib/ (sejajar dengan pages/). Pada import
// relatif, ".." berarti "naik satu folder ke atas". Jadi '../widget_form/...'
// artinya: keluar dari pages/ ke lib/, lalu masuk ke widget_form/.
// Tanpa "../", Dart akan mencari file di dalam folder pages/ (folder yang
// sama dengan menu_page.dart) dan filenya tidak akan ditemukan.

class _MenuEntry {
  final String label;
  final Widget Function() page;
  const _MenuEntry(this.label, this.page);
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuEntry> formMenu = [
      _MenuEntry('TextField', () => const NameTextField()),
      _MenuEntry('Dropdown', () => const FavoriteLanguageDropdown()),
      _MenuEntry('Switch', () => const InstagramConnectSwitch()),
      _MenuEntry('Radio', () => const GenderSelection()),
      _MenuEntry('Checkbox', () => const AgreeTermsWidget()),
      _MenuEntry('Date Picker', () => const DatePickerPage()),
      _MenuEntry('Dialog, BottomSheet & Snackbar', () => const DialogWidget()),
    ];

    final List<_MenuEntry> navigationMenu = [
      _MenuEntry('Navigation Push & Pop', () => const NavigationPush()),
      _MenuEntry('Bottom Navigation Bar', () => const BottomNavbarWidget()),
      _MenuEntry('Tab Bar', () => const TabbarWidget()),
      _MenuEntry('Drawer', () => const DrawerWidget()),
      _MenuEntry('Sliver', () => const SliverWidget()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('PAM W5S2 - Form & Navigation')),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          _sectionHeader('Form'),
          // PENJELASAN "...": itu adalah spread operator. .map(...) menghasilkan
          // sebuah Iterable<Widget> (kumpulan widget). Tanpa "...", seluruh
          // kumpulan itu akan menjadi SATU elemen di dalam children (list
          // bersarang) dan menyebabkan error tipe. Dengan "...", isi kumpulan
          // tersebut "dibongkar" dan dimasukkan satu per satu ke dalam list
          // children, sejajar dengan _sectionHeader().
          ...formMenu.map((e) => _menuTile(context, e)),
          _sectionHeader('Navigation & Layout'),
          ...navigationMenu.map((e) => _menuTile(context, e)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _menuTile(BuildContext context, _MenuEntry entry) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(entry.label),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => entry.page()),
          );
        },
      ),
    );
  }
}
