import 'package:flutter/material.dart';
import 'package:internet_radio/utils/hex_color.dart';

import 'fav_radios_page.dart';
import 'radio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _childern = [
    new RadioPage(isFavouriteOnly: false),
    FavRadiosPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: _childern[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor("#CC2200"),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor("#ffffff"),
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.play_arrow, "Ecoutez"),
            _bottomNavItem(Icons.favorite, "Favorites")
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: new Icon(
        icon,
        color: HexColor("#f4cccc"),
      ),
      activeIcon: new Icon(
        icon,
        color: HexColor("#ffffff"),
      ),
      title: new Text(
        title,
        style: TextStyle(
          color: HexColor("#ffffff"),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    // Error : setState method called after dispose()?
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
