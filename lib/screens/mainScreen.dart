import 'package:delivery_app/pages/homePage.dart';
import 'package:delivery_app/pages/mapsPage.dart';
import 'package:delivery_app/pages/orderPage.dart';
import 'package:delivery_app/pages/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Contains bottom navigation bar and all its implementation.

class MainScreen extends StatefulWidget
{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex =0;
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  MapsPage mapsPage;
  ProfilePage profilePage;

  @override
  void initState() {
    super.initState();
    homePage=HomePage();
    orderPage=OrderPage();
    mapsPage=MapsPage();
    profilePage=ProfilePage();
    pages=[homePage,orderPage,mapsPage,profilePage];
    currentPage=homePage;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index)
        {
          setState(() {
            currentIndex=index;
            currentPage=pages[index];
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text("home"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.shopping_cart),
            title: Text("Order"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.zoom_out_map),
            title: Text("Maps"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.person),
            title: Text("Profile"),
            ),

        ],
      ),
      body: currentPage,
    );
  }
}