# angstrom_editor_template

A template angstrom game.

<!-- Please change this file! -->

## Getting Started

Before running the code, you will need to generate the sqlite database which holds the sounds. To do this, install the [drift_sounds_cli](https://pub.dev/packages/drift_sounds_cli) package globally and run the `dsc` command from the root of this project:

```shell
dart pub global activate drift_sounds_cli
dsc
```

If something doesn't work, ensure that activating `drift_sounds_cli` didn't fail, and that you're in the same directory as `pubspec.yaml`, `lib`, and the other project files.

## Running The Game

If you are on windows, you can use the `test-run.bat` batch file.

## Changing Sounds

The sounds for your project live in the `sounds` directory. Make sure this directory - and not the sqlite database at `assets/sounds.sqlite3` is checked into Git.

After changing any sound file in the `sounds` directory, run the `dsc` command to rebuild the sqlite database. Don't do this while your game is running, as that'll most likely cause conflicts.

For playing sounds, I have used the [flutter_soloud](https://pub.dev/packages/flutter_soloud) package. See its documentation for which file formats are accepted.

## Adding Rooms

Whenever a new room is added in the editor (the first option in the main menu when running in debug mode), you will need to create a new class to extend the `NewRoomBase` class which is generated from a room named `New Room`. For every surface and object, you will need to create further classes.

For examples of this, see the first and second room classes, which I have placed in `lib\src\room_events`. In the interest of keeping things neat, I have used a snake case version of the room name as the file-naming convention.

## Reporting Problems

This software stack is still relatively new, and as far as I know, I'm the only one using it. If you come across any problems, please file issues against the various packages in the stack. For convenience, I have listed them here in order of dependency:

- [backstreets_widgets](https://pub.dev/packages/backstreets_widgets)
- [flutter_audio_games](https://pub.dev/packages/flutter_audio_games)
- [angstrom](https://pub.dev/packages/angstrom)
- [angstrom_editor](https://pub.dev/packages/angstrom_editor)
- [drift_sounds](https://pub.dev/packages/drift_sounds)
- [drift_sounds_database](https://pub.dev/packages/drift_sounds_database)
- [drift_sounds_cli](https://pub.dev/packages/drift_sounds_cli)
- [This template](http://github.com/chrisnorman7/angstrom_editor_template)

## Credits

Most of the sounds were made by either me talking, or making noises for earcons. For the badly-looped ambiance and the rather lovely intro sounds, see the links below or the `assets/credits.txt` file:

- [Intro sound](https://freesound.org/people/ERH/sounds/30609/)
- [Ambiance](https://freesound.org/people/klankbeeld/sounds/427512/)
