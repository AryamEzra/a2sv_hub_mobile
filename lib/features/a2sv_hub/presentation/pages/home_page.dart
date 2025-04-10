import 'package:flutter/material.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/app_drawer.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/common_app_bar.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/welcome_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Use super parameters

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy data for now, replace with actual data
  final int notificationCount = 5; // Dummy value
  final String profileImageUrl = "https://via.placeholder.com/150"; // Dummy value

  // Callback functions for AppBar actions
  void _handleMenuPressed() {
    Scaffold.of(context).openDrawer();
  }

  void _handleSearchPress() {
    print("Search pressed in HomePage");
  }

  void _handleSparklePress() {
    print("Sparkle pressed in HomePage");
  }

  void _handleNotificationPress() {
    print("Notification pressed in HomePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          notificationCount: notificationCount,
          profileImageUrl: profileImageUrl,
          onMenuPressed: _handleMenuPressed,
          onSearchPressed: _handleSearchPress,
          onSparklePressed: _handleSparklePress,
          onNotificationPressed: _handleNotificationPress),

      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: ListView( // Use ListView to allow scrolling if content grows
        children: [
          WelcomeCard(
            // Access data from the widget using 'widget.'
            quote: _quote,
            author: _author,
            username: _username,
            onProblemsPressed: _handleProblemsPressed, // Pass the function
          ),

          // --- Add other widgets for your home page below ---
        ],
      ),
    );
  }

  // Access widget properties directly within the state
  String get _quote => "You do not read a book for the book's sake, but for your own.";
  String get _author => "Earl Nightingale";
  String get _username => "Aryam";

  // You can keep or modify this, but it should now refer to widget properties if needed.
  void _handleProblemsPressed() {
    print("Problems button pressed!");
  }
}
