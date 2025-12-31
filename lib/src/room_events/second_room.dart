import 'package:angstrom_editor_template/src/rooms/the_second_room.dart';

/// The second room.
class SecondRoom extends TheSecondRoomBase {
  /// Create an instance.
  const SecondRoom();

  /// The door.
  @override
  SecondRoomDoor get door => const SecondRoomDoor();

  /// The floor.
  @override
  SecondRoomFloor get floor => const SecondRoomFloor();
}

/// The floor.
class SecondRoomFloor extends TheSecondRoomFloorBase {
  /// Create an instance.
  const SecondRoomFloor();
}

/// The door.
class SecondRoomDoor extends TheSecondRoomDoorBase {
  /// Create an instance.
  const SecondRoomDoor();
}
