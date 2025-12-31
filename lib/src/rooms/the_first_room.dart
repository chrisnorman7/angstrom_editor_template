// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:angstrom/angstrom.dart' as _i1;
import 'dart:math' as _i2;
import 'package:meta/meta.dart' as _i3;

/// Provides events for The First Room.
abstract class TheFirstRoomBase {
  /// Create an instance.
  const TheFirstRoomBase();

  /// Floor.
  TheFirstRoomFloorBase get floor;

  /// Door.
  TheFirstRoomDoorBase get door;
}

/// Events for Floor.
abstract class TheFirstRoomFloorBase {
  /// Create an instance.
  const TheFirstRoomFloorBase();

  /// The ID of this surface.
  @_i3.nonVirtual
  String get id => '019b7452-2ead-7d18-9759-e9dbd81cb676';

  /// The name of this surface.
  @_i3.nonVirtual
  String get name => 'Floor';

  /// Whether this surface is a wall.
  @_i3.nonVirtual
  bool get isWall => false;

  /// The sound which plays while on this surface.
  @_i3.nonVirtual
  _i1.SoundReference get ambiance =>
      const _i1.SoundReference(path: 'sounds/ambiance/ambiance.mp3');
}

/// Events for the Door object.
abstract class TheFirstRoomDoorBase {
  /// Create an instance.
  const TheFirstRoomDoorBase();

  /// The ID of this object.
  @_i3.nonVirtual
  String get id => '019b7454-3a05-70dd-b4c7-ea17752ca0f6';

  /// The name of the object.
  @_i3.nonVirtual
  String get name => 'Door';

  /// The point where this object will start out in the room.
  @_i3.nonVirtual
  _i2.Point<int> get startCoordinates => const _i2.Point(9, 9);

  /// The ambiance for this object.
  @_i3.nonVirtual
  _i1.SoundReference get ambiance =>
      const _i1.SoundReference(path: 'sounds/ambiance/first_room_door.mp3');

  /// The max distance at which the [ambiance] will play for this object.
  @_i3.nonVirtual
  int get ambianceMaxDistance => 20;

  /// Use the door.
  void onActivateCommand(_i1.AngstromEngine engine) {
    _i1.Door(
      coordinates: const _i2.Point(0, 0),
      destinationId: 'rooms/the_second_room.json',
      useSound: const _i1.SoundReference(path: 'sounds/doors/door_open_1.mp3'),
    ).onActivate(engine);
  }
}
