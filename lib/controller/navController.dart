import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/screens/favorite_blog_screen.dart';

class NavigationBarController extends StatefulWidget {
  const NavigationBarController({Key? key}) : super(key: key);

  @override
  State<NavigationBarController> createState() =>
      _NavigationBarControllerState();
}

class _NavigationBarControllerState extends State<NavigationBarController> {
  int _selectedItem = 0;
  List<Widget> navBarItems = [BlogsListScreen(), FavoriteBlogs()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarItems[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
      ),
    );
  }
}
