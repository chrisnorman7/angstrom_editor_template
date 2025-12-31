import 'package:angstrom_editor_template/gen/assets.gen.dart';
import 'package:angstrom_editor_template/src/screens/home_page.dart';
import 'package:drift_sounds/drift_sounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';

void main() {
  runApp(const MyApp());
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => DriftSoundsDatabaseScope(
    assetKey: Assets.sounds,
    databaseFilename: 'angstrom_editor_template_sounds.sqlite3',
    child: SoLoudScope(
      child: MaterialApp(
        title: 'Angstrom Template',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomePage(),
      ),
    ),
  );
}
