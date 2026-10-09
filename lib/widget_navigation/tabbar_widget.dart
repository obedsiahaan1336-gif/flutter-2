import 'package:flutter/material.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // PENJELASAN: TabController mengatur tab yang sedang aktif.
    // - length: 3 -> jumlah tab. Harus sama dengan jumlah Tab di TabBar dan
    //   jumlah children di TabBarView, kalau tidak akan terjadi error.
    // - vsync: this -> menyediakan Ticker (penghitung frame) untuk animasi
    //   perpindahan tab agar sinkron dengan refresh layar dan hemat resource.
    //   "this" bisa dipakai karena class ini memakai
    //   SingleTickerProviderStateMixin.
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FIC - Tabbar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.directions_boat),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
            ),
            Tab(
              icon: Icon(Icons.directions_ferry),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text('Tab 1'),
          ),
          Center(
            child: Text('Tab 2'),
          ),
          Center(
            child: Text('Tab 3'),
          ),
        ],
      ),
    );
  }
}

class TabbarDefaultWidget extends StatelessWidget {
  const TabbarDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FIC - Tabbar'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_boat)),
              Tab(icon: Icon(Icons.directions_bus)),
              Tab(icon: Icon(Icons.directions_ferry)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Tab 1')),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
          ],
        ),
      ),
    );
  }
}
