import 'package:drivecam/widgets/app_bar.dart';
import 'package:drivecam/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      // light mode
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeProvider.seedColor),
      ),
      // dark mode
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeProvider.seedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: const Scaffold(
        appBar: MyAppBar(title: 'Example'),
        body: Center(child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // load initial state
  @override
  void initState() {
    super.initState();
    final themeProvider = context.read<ThemeProvider>();
    themeProvider.loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Hello World!');
  }
}
