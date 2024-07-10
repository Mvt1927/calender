// generate a box with a text inside
import 'package:calender/src/settings/settings_controller.dart';
import 'package:calender/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SettingsController controller;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Examples'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Card(child: _SampleCard(cardName: 'Elevated Card')),
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  debugPrint(controller.themeMode.toString());
                  controller.updateThemeMode(
                      controller.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light);
                },
                child: _SampleCard(cardName: 'Clickable Card'),
              ),
            ),
            // Card.filled(child: _SampleCard(cardName: 'Filled Card')),
            // Card.outlined(child: _SampleCard(cardName: 'Outlined Card')),
          ],
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(child: Text(cardName)),
    );
  }
}
