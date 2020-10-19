
import 'package:delivery_app/DeliverBoy/Dhomepage.dart';
import 'package:delivery_app/DeliverBoy/Dmapspage.dart';
import 'package:delivery_app/DeliverBoy/Dorderpage.dart';
import 'package:delivery_app/DeliverBoy/Dprofilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Contains bottom navigation bar and all its implementation.


class Dmainscreen extends StatefulWidget
{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Dmainscreen> {
  int currentIndex =0;
  List<Widget> pages;
  Widget currentPage;
  DHomePage DhomePage;
  DOrderPage DorderPage;
  DMapsPage DmapsPage;
  DProfilePage DprofilePage;

  @override
  void initState() {
    super.initState();
    DhomePage=DHomePage();
    DorderPage=DOrderPage();
    DmapsPage=DMapsPage();
    DprofilePage=DProfilePage();
    pages=[DhomePage,DorderPage,DmapsPage,DprofilePage];
    currentPage=DhomePage;

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