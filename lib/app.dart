import 'package:flutter/material.dart';
import 'package:lab/constants/ui_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: UiConstants.navItems[pageIndex].page),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade800, Colors.deepPurple.shade600],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: UiConstants.navItems
              .map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      pageIndex = UiConstants.navItems.indexOf(e);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        e.icon,
                        color: pageIndex == UiConstants.navItems.indexOf(e)
                            ? Colors.white
                            : Colors.white38,
                        size: 26,
                      ),
                      const SizedBox(height: 5),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        width: pageIndex == UiConstants.navItems.indexOf(e)
                            ? 20
                            : 0,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
