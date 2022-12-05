import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/home.dart';
import 'package:flutter_firebase/pages/settings.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ScreenHiddenDrawer> pages = [];
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  void initState() {
    super.initState();
    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: const TextStyle(color: Colors.white, fontSize: 18),
          selectedStyle: const TextStyle(color: Colors.white, fontSize: 18),
          colorLineSelected: Colors.white,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle: const TextStyle(color: Colors.white, fontSize: 18),
          selectedStyle: const TextStyle(color: Colors.white, fontSize: 18),
          colorLineSelected: Colors.white,
        ),
        const SettingPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: pages,
      elevationAppBar: 0,
      backgroundColorMenu: Colors.deepPurple,
      initPositionSelected: 0,
      slidePercent: 50,
      contentCornerRadius: 30,
    );
  }
}
