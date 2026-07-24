import 'package:flutter/material.dart';
 
/// Entry point of the Flutter application.
/// Starts the app by running StateManagementActivity.
void main() {
  runApp(const StateManagementActivity());
}
 
/// Root widget of the application.
/// Manages the application's theme (Light/Dark).
class StateManagementActivity extends StatefulWidget {
  const StateManagementActivity({super.key});
 
  @override
  State<StateManagementActivity> createState() =>
      _StateManagementActivityState();
}
 
/// Stores the app-wide state such as the current theme mode.
class _StateManagementActivityState extends State<StateManagementActivity> {
 
  /// Stores whether Dark Mode is enabled.
  bool _isDarkMode = false;
 
  /// Toggles between Light and Dark themes.
  /// Uses setState() to rebuild the MaterialApp with the new theme.
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }
 
  /// Builds the root MaterialApp and applies the selected theme.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}
 
/// Home screen of the application.
/// Displays the counter and the theme switch.
class MyHomePage extends StatefulWidget {
 
  /// Current theme mode.
  final bool isDarkMode;
 
  /// Function used to change the app theme.
  final ValueChanged<bool> onThemeChanged;
 
  const MyHomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
/// Stores the local (ephemeral) state of the counter.
class _MyHomePageState extends State<MyHomePage> {
 
  /// Holds the current counter value.
  int _counter = 0;
 
  /// Increases the counter by one.
  /// setState() rebuilds only this page to display the updated value.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
 
  /// Builds the user interface of the home page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter & Theme App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
 
            /// Displays a label above the counter.
            const Text(
              'You have pushed the button this many times:',
            ),
 
            /// Displays the current counter value.
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
 
            const SizedBox(height: 30),
 
            /// Switch used to toggle between Light and Dark themes.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: widget.isDarkMode,
                  onChanged: widget.onThemeChanged,
                ),
              ],
            ),
          ],
        ),
      ),
 
      /// Floating button that increments the counter.
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
 