// lib/common_app_bar.dart (or lib/presentation/widgets/common_app_bar.dart)

import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;
  final String profileImageUrl;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSparklePressed;
  final VoidCallback? onNotificationPressed;
  // Add callbacks for other buttons if needed

  const CommonAppBar({
    super.key,
    required this.notificationCount,
    required this.profileImageUrl,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onSparklePressed,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    // This is the AppBar code copied from TracksPage
    return AppBar(
      backgroundColor: Colors.white, // Background color for the AppBar
      elevation: 1.0, // Subtle shadow below the AppBar
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black54), // Menu Icon
        // Use the passed callback, or do nothing if null
        onPressed: onMenuPressed ?? () { print("Menu button pressed (default)"); },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black54),
           // Use the passed callback
          onPressed: onSearchPressed ?? () { print("Search button pressed (default)"); },
        ),
        // You might want to remove this fixed SizedBox or make it configurable
        // if different screens need different spacing
        const SizedBox(width: 133), // <-- Consider removing/adjusting this later

        IconButton(
          icon: const Icon(Icons.auto_awesome, color: Colors.orangeAccent),
           // Use the passed callback
          onPressed: onSparklePressed ?? () { print("Sparkle button pressed (default)"); },
        ),
        const SizedBox(width: 8), // Spacing before notifications

        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black54),
               // Use the passed callback
              onPressed: onNotificationPressed ?? () { print("Notification button pressed (default)"); },
            ),
            if (notificationCount > 0) // Use the passed notificationCount
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1)
                  ),
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    '$notificationCount', // Use the passed notificationCount
                    style: const TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8), // Spacing before profile

        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl), // Use the passed profileImageUrl
                backgroundColor: Colors.grey[200],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12, height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Implementing PreferredSizeWidget requires this getter
  // kToolbarHeight is the default AppBar height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}