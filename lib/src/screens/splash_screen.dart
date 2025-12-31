import 'package:angstrom_editor_template/sounds.gen.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift_sounds/drift_sounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';

/// The splash screen for the game.
class SplashScreen extends StatelessWidget {
  /// Create an instance.
  const SplashScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final sounds = context.sounds;
    context.playSound(sounds.ambiance.intro.sound(destroy: true));
    return const SimpleScaffold(
      title: 'Welcome',
      body: CenterText(
        text: 'Edit `SplashScreen.build` to change this screen.',
        autofocus: true,
      ),
    );
  }
}
