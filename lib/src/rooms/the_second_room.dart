// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:math' as _i1;
import 'package:angstrom/angstrom.dart' as _i2;
import 'package:meta/meta.dart' as _i3;

/// Provides events for The Second Room.
abstract class TheSecondRoomBase {
  /// Create an instance.
  const TheSecondRoomBase();

  /// Floor.
  TheSecondRoomFloorBase get floor;

  /// Door.
  TheSecondRoomDoorBase get door;
}

/// Events for Floor.
abstract class TheSecondRoomFloorBase {
  /// Create an instance.
  const TheSecondRoomFloorBase();

  /// The ID of this surface.
  @_i3.nonVirtual
  String get id => '019b7452-43e1-73c6-a389-27feebd72187';

  /// The name of this surface.
  @_i3.nonVirtual
  String get name => 'Floor';

  /// Whether this surface is a wall.
  @_i3.nonVirtual
  bool get isWall => false;
}

/// Events for the Door object.
abstract class TheSecondRoomDoorBase {
  /// Create an instance.
  const TheSecondRoomDoorBase();

  /// The ID of this object.
  @_i3.nonVirtual
  String get id => '019b7453-9bac-7027-821e-d9244cb6df14';

  /// The name of the object.
  @_i3.nonVirtual
  String get name => 'Door';

  /// The point where this object will start out in the room.
  @_i3.nonVirtual
  _i1.Point<int> get startCoordinates => const _i1.Point(0, 0);

  /// The ambiance for this object.
  @_i3.nonVirtual
  _i2.SoundReference get ambiance =>
      const _i2.SoundReference(path: 'sounds/ambiance/second_room_door.mp3');

  /// The max distance at which the [ambiance] will play for this object.
  @_i3.nonVirtual
  int get ambianceMaxDistance => 20;

  /// Use the door.
  void onActivateCommand(_i2.AngstromEngine engine) {
    _i2.Door(
      coordinates: const _i1.Point(9, 9),
      destinationId: 'rooms/the_first_room.json',
      useSound: const _i2.SoundReference(path: 'sounds/doors/door_close_1.mp3'),
    ).onActivate(engine);
  }
}
