import 'package:drivecam/provider/theme_provider.dart';
import 'package:drivecam/widgets/recording_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
    return BottomAppBar(
      child: Row(
        spacing: 56,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(icon: const Icon(Icons.home), onPressed: () {}), // TODO: implement clip button
          RecordingButton(themeProvider: themeProvider),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}), // TODO: implement settings button
        ],
      ),
    );
  }
}
