import 'package:drivecam/widgets/app_bar.dart';
import 'package:drivecam/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class ClipManagerScreen extends StatelessWidget {
  const ClipManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Clip Manager'),
      body: Center(child: Text('Clip Manager')),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
