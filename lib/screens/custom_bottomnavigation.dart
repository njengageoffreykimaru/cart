
import 'package:cart/screens/AddToCart.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../favouriteScreen/favourite_screen.dart';
import 'AccountScreen.dart';
import 'Profile.dart';
import 'home.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;

  List<Widget> _buildScreens() => [
    Home(),
    CartScreen(), // Changed to AddToCart widget instead of CartScreen
    FavouriteScreen(),
    // Assuming you want to have a Profile screen here, add the Profile widget

    AccountScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.blue[900],
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add_shopping_cart),
      title: "Add To Cart",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.blue[900],
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite_outlined),
      title: "Favourite",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.blue[900],
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Account",activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.blue[900],
    ),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: _onWillPop,
    child: Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        resizeToAvoidBottomInset: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        bottomScreenMargin: 0,
        backgroundColor: Colors.green,
        hideNavigationBar: _hideNavBar,
        decoration:
        const NavBarDecoration(colorBehindNavBar: Colors.red),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    ),
  );
}
