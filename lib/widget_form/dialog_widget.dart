import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog & Bottomsheet')),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // 1. Dialog
            ElevatedButton(
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Info'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text('Your order was placed!'),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Open Dialog'),
            ),
            const SizedBox(height: 8),
            // 2. Bottom sheet
            ElevatedButton(
              onPressed: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Your order was placed!'),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Ok"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Open BottomSheet'),
            ),
            const SizedBox(height: 8),
            // 3. Bottom sheet dengan konfirmasi
            ElevatedButton(
              onPressed: () async {
                bool confirm = false;
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Are you sure you want to place this order?',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
                // Dijalankan setelah bottom sheet ditutup.
                if (!mounted) return;
                if (confirm) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order confirmed')),
                  );
                }
              },
              child: const Text('Open Bottomsheet confirmation'),
            ),
            const SizedBox(height: 8),
            // 4. Snackbar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text('Your request is successful'),
                  ),
                );
              },
              child: const Text('Open snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
