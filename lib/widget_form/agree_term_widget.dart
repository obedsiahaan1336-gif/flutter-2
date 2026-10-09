import 'package:flutter/material.dart';

class AgreeTermsWidget extends StatefulWidget {
  const AgreeTermsWidget({super.key});

  @override
  State<AgreeTermsWidget> createState() => _AgreeTermsWidgetState();
}

class _AgreeTermsWidgetState extends State<AgreeTermsWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agree Term Condition Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              activeColor: Colors.blue,
              onChanged: (val) {
                setState(() {
                  if (val != null) {
                    isChecked = val;
                  }
                });
              },
            ),
            const SizedBox(width: 4),
            const Text(
              'Agree Terms & Conditions',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
