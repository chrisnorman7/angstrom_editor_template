import 'package:angstrom_editor_template/src/screens/main_menu.dart';
import 'package:angstrom_editor_template/src/screens/splash_screen.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

/// The home screen of the app.
class HomePage extends StatefulWidget {
  /// Create an instance.
  const HomePage({super.key});

  /// Create state for this widget.
  @override
  HomePageState createState() => HomePageState();
}

/// State for [HomePage].
class HomePageState extends State<HomePage> {
  /// Whether the audio has been initialized yet.
  late bool _audioReady;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _audioReady = !kIsWeb;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    if (!_audioReady) {
      RendererBinding.instance.ensureSemantics();
      return SimpleScaffold(
        title: 'Start Audio',
        body: Center(
          child: TextButton(
            onPressed: () async {
              await SoLoud.instance.init();
              if (mounted) {
                setState(() {
                  _audioReady = true;
                });
              }
            },
            child: const Text('Start audio'),
          ),
        ),
      );
    }
    return TimedBuilders(
      duration: const Duration(seconds: 3),
      builders: [(_) => const SplashScreen(), (_) => const MainMenu()],
    );
  }
}
