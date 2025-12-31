import 'dart:convert';
import 'dart:io';

import 'package:angstrom/angstrom.dart';
import 'package:angstrom_editor/angstrom_editor.dart';
import 'package:angstrom_editor_template/gen/assets.gen.dart';
import 'package:angstrom_editor_template/sounds.gen.dart';
import 'package:angstrom_editor_template/src/constants.dart';
import 'package:angstrom_editor_template/src/screens/player_character_screen.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift_sounds/drift_sounds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// The main menu for the game.
class MainMenu extends StatefulWidget {
  /// Create an instance.
  const MainMenu({this.numberOfCharacters = 5, super.key});

  /// The number of characters which should be created.
  final int numberOfCharacters;

  /// Create state for this widget.
  @override
  MainMenuState createState() => MainMenuState();
}

/// State for [MainMenu].
class MainMenuState extends State<MainMenu> {
  /// The UUID generator to use.
  late final Uuid _uuid;

  /// The sounds to play.
  late Sounds sounds;

  /// The players which have been loaded.
  List<PlayerCharacter>? _playerCharacters;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _uuid = const Uuid();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final characters = _playerCharacters;
    if (characters == null) {
      _loadPlayerCharacters();
      return const LoadingScreen();
    }
    sounds = context.sounds;
    return AudioGameMenu(
      title: 'Main Menu',
      menuItems: [
        if (kDebugMode)
          AudioGameMenuItem(
            title: 'Room Editor',
            onActivate: (final innerContext) =>
                innerContext.fadeMusicAndPushWidget(
                  (_) => Cancel(
                    child: AngstromEditor(
                      directory: Directory('rooms'),
                      engineCommandsFile: File('engine_commands.json'),
                      footsteps: [
                        for (final soundList in sounds.footsteps.subdirectories)
                          FootstepsSounds(
                            name: soundList.name,
                            soundPaths: soundList.soundPaths.toList(),
                          ),
                      ],
                      musicSoundPaths: sounds.music.soundPaths.toList(),
                      ambianceSoundPaths: sounds.ambiance.soundPaths.toList(),
                      doorSoundPaths: sounds.doors.soundPaths.toList(),
                      buildCompleteSound: sounds.build.buildComplete.sound(
                        destroy: true,
                      ),
                      buildFailSound: sounds.build.buildFailed.sound(
                        destroy: true,
                      ),
                      getSound: _getSound,
                    ),
                  ),
                ),
          ),
        ...characters.map(
          (final character) => AudioGameMenuItem(
            title: character.name,
            onActivate: (final innerContext) =>
                innerContext.fadeMusicAndPushWidget(
                  (_) => PlayerCharacterScreen(
                    playerCharacter: character,
                    getSound: _getSound,
                    savePlayer: () async {
                      final value = characters.map(jsonEncode).toList();
                      final preferences = SharedPreferencesAsync();
                      await preferences.setStringList(
                        playerCharactersKey,
                        value,
                      );
                    },
                  ),
                ),
          ),
        ),
      ],
      activateItemSound: sounds.menu.activate.sound(destroy: true),
      selectItemSound: sounds.menu.select.sound(destroy: false),
      music: sounds.music.mainTheme.sound(destroy: false, looping: true),
      musicFadeInTime: Duration.zero,
      musicFadeOutTime: const Duration(seconds: 4),
    );
  }

  /// Generate a new ID.
  String newId() => _uuid.v4();

  /// Get a [Sound] from [soundReference].
  Sound _getSound({
    required final SoundReference soundReference,
    required final bool destroy,
    final LoadMode loadMode = LoadMode.memory,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
    final double relativePlaySpeed = 1.0,
    final double? volume,
  }) {
    final reference = sounds.ensureSoundReference(soundReference.path);
    return reference.sound(
      destroy: destroy,
      looping: looping,
      loopingStart: loopingStart,
      paused: paused,
      position: position,
      relativePlaySpeed: relativePlaySpeed,
      volume: volume ?? soundReference.volume,
    );
  }

  /// Load the player characters.
  Future<void> _loadPlayerCharacters() async {
    final preferences = SharedPreferencesAsync();
    final strings =
        (await preferences.getStringList(playerCharactersKey)) ?? [];
    final characters = strings
        .map(
          (final string) => PlayerCharacter.fromJson(
            jsonDecode(string) as Map<String, dynamic>,
          ),
        )
        .toList();
    while (characters.length < widget.numberOfCharacters) {
      characters.add(
        PlayerCharacter(
          id: newId(),
          name: 'Player ${characters.length + 1}',
          locationId: Assets.rooms.theFirstRoom,
          x: 0,
          y: 0,
          statsMap: {},
        ),
      );
    }
    if (mounted) {
      setState(() {
        _playerCharacters = characters;
      });
    }
  }
}
