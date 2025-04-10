import 'package:flutter/material.dart';
import 'package:myapp/features/a2sv_hub/presentation/pages/tracks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracks App Header Demo',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize the theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TracksPage(), // Set TracksPage as the home screen
    );
  }
}