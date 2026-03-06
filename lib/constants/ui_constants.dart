import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/profile_screen.dart';

class NavItem {
  final IconData icon;
  final Widget page;

  const NavItem({required this.icon, required this.page});
}

class UiConstants {
  static const List<NavItem> navItems = [
    NavItem(icon: Icons.home, page: HomeScreen()),
    NavItem(icon: Icons.notifications, page: NotificationsScreen()),
    NavItem(icon: Icons.person, page: ProfileScreen()),
  ];
}
