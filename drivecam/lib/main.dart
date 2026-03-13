import 'package:camera/camera.dart';
import 'package:drivecam/widgets/app_bar.dart';
import 'package:drivecam/widgets/bottom_app_bar.dart';
import 'package:drivecam/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: MainApp(camera: firstCamera),
    ),
  );
}

class MainApp extends StatelessWidget {
  final CameraDescription camera;
  const MainApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeProvider.seedColor),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeProvider.seedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: Scaffold(
        appBar: const MyAppBar(title: 'Example'),
        body: HomePage(camera: camera),
        bottomNavigationBar: const MyBottomNavBar(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final CameraDescription camera;
  const HomePage({super.key, required this.camera});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().loadDarkModePrefs();
    _controller = CameraController(widget.camera, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
