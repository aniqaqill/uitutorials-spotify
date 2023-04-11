import 'package:flutter/material.dart';
import 'package:uitutorials/views/home.dart';
import 'package:uitutorials/views/library.dart';
import 'package:uitutorials/views/search.dart';

class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Library',
            ),
          ],
          // currentIndex: 0,
          selectedItemColor: Colors.greenAccent,
        ),
        body: Stack(
          children: [
            IgnorePointer(
              ignoring: _selectedTab != 0,
              child: Opacity(
                opacity: _selectedTab == 0 ? 1 : 0,
                child: HomeView(),
              ),
            ),
            IgnorePointer(
              ignoring: _selectedTab != 1,
              child: Opacity(
                opacity: _selectedTab == 1 ? 1 : 0,
                child: Center(
                  child: SearchView(),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: _selectedTab != 2,
              child: Opacity(
                opacity: _selectedTab == 2 ? 1 : 0,
                child: Center(
                  child: LibraryView(),
                ),
              ),
            ),
          ],
        ));
  }
}
