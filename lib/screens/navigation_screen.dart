import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cboo_portal_app/screens/employee_pay_screen.dart';
import 'package:cboo_portal_app/screens/favorites_screen.dart';
import 'package:cboo_portal_app/screens/home_screen.dart';
import 'package:cboo_portal_app/screens/settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    EmployeePayScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  triggerNotification() {
    try {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Payslip Update!',
          body:
              'Yay! Your Payslip for the period September 1-15 has been generated successfully!',
        ),
      );
    } catch (error) {
      debugPrint('Notification creation failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.tealAccent,
          child: FloatingActionButton(
            onPressed: triggerNotification,
            child: Icon(
              Icons.qr_code,
              size: 20,
            ),
            backgroundColor: Colors.teal,
            elevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.doc,
          CupertinoIcons.heart,
          Icons.settings_outlined,
        ],
        inactiveColor: Colors.black,
        activeColor: Colors.teal,
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
