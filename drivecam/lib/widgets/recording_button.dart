import 'package:drivecam/provider/theme_provider.dart';
import 'package:flutter/material.dart';

class RecordingButton extends StatelessWidget {
  const RecordingButton({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  void toggleRecording(BuildContext context) {
    themeProvider.toggleRecordingButtonColor();
    if (themeProvider.recordingOn) {
      // TODO: start recording
    } else {
      // TODO: stop recording
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(72, 72),
        padding: EdgeInsets.zero,
      ),
      onPressed: () => (toggleRecording(context)),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeProvider.recordButtonColor,
        ),
      ),
    );
  }
}
