import 'package:f_cheatsheet/staggle_grid/index.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'animated_switcher/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Flat button',
            padding: const EdgeInsets.all(5), // optional padding customization
            background: Colors.red, // optional background color customization
            builder: (_, k) => MaterialButton(
              onPressed:
                  k.boolean(label: 'Enabled', initial: true) ? () {} : null,
              child: Text(k.text(label: 'Text', initial: 'Flat button')),
            ),
          ),
          Story(
            name: 'Raised button',
            builder: (_, k) => ElevatedButton(
              onPressed:
                  k.boolean(label: 'Enabled', initial: true) ? () {} : null,
              style: ElevatedButton.styleFrom(
                primary: k.options<Color>(
                  label: 'Color',
                  initial: Colors.deepOrange,
                  options: const [
                    Option('Red', Colors.deepOrange),
                    Option('Green', Colors.teal),
                  ],
                ),
              ),
              child: Text(k.text(label: 'Text', initial: 'Raised button')),
            ),
          ),
          Story(
            name: 'Staggle grid view',
            builder: (_, k) => const StaggleGrid(),
          ),
          Story(
            name: 'Animated Switcher',
            builder: (_, k) => AnimatedPage(),
          ),
          Story.simple(
            name: 'Input field',
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input field',
              ),
            ),
          ),
        ],
      );
}
