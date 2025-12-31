import 'package:angstrom/angstrom.dart';
import 'package:angstrom_editor_template/src/custom_engine.dart';
import 'package:angstrom_editor_template/src/room_events/first_room.dart';
import 'package:angstrom_editor_template/src/room_events/second_room.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

/// A screen for playing a [playerCharacter].
class PlayerCharacterScreen extends StatefulWidget {
  /// Create an instance.
  const PlayerCharacterScreen({
    required this.playerCharacter,
    required this.getSound,
    required this.savePlayer,
    super.key,
  });

  /// The character to play.
  final PlayerCharacter playerCharacter;

  /// The function to get sounds from [SoundReference]s.
  final GetSound getSound;

  /// The function to call to save the [playerCharacter].
  final Future<void> Function() savePlayer;

  /// Create state for this widget.
  @override
  PlayerCharacterScreenState createState() => PlayerCharacterScreenState();
}

/// State for [PlayerCharacterScreen].
class PlayerCharacterScreenState extends State<PlayerCharacterScreen> {
  /// The master volume.
  late int _masterVolume;

  /// The engine to use.
  late CustomEngine _engine;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _masterVolume = 100;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final assetBundle = DefaultAssetBundle.of(context);
    _engine = CustomEngine(
      playerCharacter: widget.playerCharacter,
      assetBundle: assetBundle,
      theFirstRoom: const FirstRoom(),
      theSecondRoom: const SecondRoom(),
    );
    return GameScreen(
      engine: _engine,
      title: widget.playerCharacter.name,
      getSound: widget.getSound,
      gameShortcutsBuilder: (final context, final shortcuts) {
        shortcuts.addAll([
          GameShortcut(
            title: 'Save player',
            shortcut: GameShortcutsShortcut.f4,
            onStart: (final innerContext) async {
              await widget.savePlayer();
              if (mounted) {
                _engine.speak('Player saved.');
              }
            },
          ),
          GameShortcut(
            title: 'Volume up',
            shortcut: GameShortcutsShortcut.pageUp,
            onStart: (final innerContext) => _setVolume(_masterVolume + 5),
          ),
          GameShortcut(
            title: 'Volume down',
            shortcut: GameShortcutsShortcut.pageDown,
            onStart: (final innerContext) => _setVolume(_masterVolume - 5),
          ),
        ]);
        return shortcuts;
      },
    );
  }

  /// Set the new volume.
  void _setVolume(final int volume) {
    _masterVolume = volume.clamp(0, 100);
    SoLoud.instance.setGlobalVolume(_masterVolume / 100);
    _engine.speak('Volume $_masterVolume%');
  }
}
