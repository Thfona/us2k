import 'package:flutter/material.dart';
import 'package:us2k/views/home.dart';

// Main method
Future<void> main() async {
  // Ensures Flutter widgets are bound before proceeding
  WidgetsFlutterBinding.ensureInitialized();

  // Starts app
  runApp(const App());
}

// App widget
class App extends StatelessWidget {
  // Defines App widget
  const App({Key? key}) : super(key: key);

  // Build function
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultimate Soundboard 2000',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(title: 'Ultimate Soundboard 2000'),
    );
  }
}
