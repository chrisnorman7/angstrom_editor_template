// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:angstrom_editor/angstrom_editor.dart' as _i1;
import 'rooms/_rooms.dart' as _i2;

/// The custom engine for your game.
///
/// This class will ensure that your custom callbacks can be loaded in a
/// completely type safe manner.
class CustomEngine extends _i1.AssetLoadingAngstromEngine {
  /// Create an instance.
  CustomEngine({
    required super.playerCharacter,
    required super.assetBundle,
    required this.theFirstRoom,
    required this.theSecondRoom,
    super.musicFadeIn,
    super.musicFadeOut,
  });

  /// Events for The First Room. Used by [buildRoom].
  final _i2.TheFirstRoomBase theFirstRoom;

  /// Events for The Second Room. Used by [buildRoom].
  final _i2.TheSecondRoomBase theSecondRoom;

  /// Provides the properties created by code gen.
  @override
  Map<String, _i1.LoadedRoomEvents> get roomEvents => {
    // The First Room events.
    'rooms/the_first_room.json': _i1.LoadedRoomEvents(
      surfaceEvents: {},
      objectEvents: {
        // Door.
        '019b7454-3a05-70dd-b4c7-ea17752ca0f6': _i1.EditorRoomObjectEvents(
          onActivate: theFirstRoom.door.onActivateCommand,
        ),
      },
    ),
    // The Second Room events.
    'rooms/the_second_room.json': _i1.LoadedRoomEvents(
      surfaceEvents: {},
      objectEvents: {
        // Door.
        '019b7453-9bac-7027-821e-d9244cb6df14': _i1.EditorRoomObjectEvents(
          onActivate: theSecondRoom.door.onActivateCommand,
        ),
      },
    ),
  };
}
