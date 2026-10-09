import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FIC - Drawer"),
      ),
      body: const Center(
        child: Text('Tekan ikon menu di pojokan kanan atas, atau geser dari tepi kanan'),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                color: Colors.blue[100],
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    child: FlutterLogo(size: 50),
                  ),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  accountName: const Text(
                    'Michael', //ketahuan kali sih kalo ga diganti dengan nama dan nim nya :)
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: const Text(
                    'michael.dev@gmail.com', //TODO
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Menu 1'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Menu 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
