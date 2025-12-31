import 'package:angstrom_editor_template/src/rooms/the_first_room.dart';

/// The first room.
class FirstRoom extends TheFirstRoomBase {
  /// Create an instance.
  const FirstRoom();

  /// The door out.
  @override
  FirstRoomDoor get door => const FirstRoomDoor();

  /// The floor.
  @override
  FirstRoomFloor get floor => const FirstRoomFloor();
}

/// The floor.
class FirstRoomFloor extends TheFirstRoomFloorBase {
  /// Create an instance.
  const FirstRoomFloor();
}

/// The door out.
class FirstRoomDoor extends TheFirstRoomDoorBase {
  /// Create an instance.
  const FirstRoomDoor();
}
