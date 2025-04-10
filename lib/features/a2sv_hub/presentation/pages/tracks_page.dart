// tracks_page.dart
import 'package:flutter/material.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/common_app_bar.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/progress_card.dart';
import 'package:myapp/features/a2sv_hub/presentation/widgets/stats_card.dart';
// Import the new AppBar widget // Adjust path if needed

class TracksPage extends StatefulWidget {
  const TracksPage({super.key});

  @override
  State<TracksPage> createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  final int notificationCount = 8; // Data lives here
  final String profileImageUrl = 'https://via.placeholder.com/150/92c952'; // Data lives here

  // Define callback functions for AppBar actions (optional)
  void _handleMenuPress() {
    // Example: Open a drawer if you have one
    // Scaffold.of(context).openDrawer();
    print("Menu button pressed (handled in TracksPage)");
     // Add actual logic here
  }

  void _handleSearchPress() {
    print("Search button pressed (handled in TracksPage)");
    // Add actual logic here
  }

   void _handleSparklePress() {
    print("Sparkle button pressed (handled in TracksPage)");
    // Add actual logic here
  }

   void _handleNotificationPress() {
    print("Notification button pressed (handled in TracksPage)");
    // Add actual logic here
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace the old AppBar definition with the new widget
      appBar: CommonAppBar(
        notificationCount: notificationCount, // Pass the data
        profileImageUrl: profileImageUrl,     // Pass the data
        onMenuPressed: _handleMenuPress,         // Pass the callback function
        onSearchPressed: _handleSearchPress,     // Pass the callback function
        onSparklePressed: _handleSparklePress,
        onNotificationPressed: _handleNotificationPress,
        // Pass other callbacks if defined
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          Text(
            "Tracks",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4.0),
          Text(
            "All",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[700],
                ),
          ),
          const SizedBox(height: 20.0),
          const ProgressCard(),
          const SizedBox(height: 16.0),
          const StatsCard(),
        ],
      ),
    );
  }
}