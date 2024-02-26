import 'package:flutter/material.dart';
import 'package:insta_clone/provider/user_provider.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/models/user.dart' as model;
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/global_varialbles.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  signout() async {
    AuthMethods().signOut();
  }

  @override
  void initState() {
    super.initState();
    //pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    //pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      //  _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    // pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    PageController _pageController = PageController(initialPage: 0);

    void _onPageChanged(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }

    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
