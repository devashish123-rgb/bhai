import 'package:delivery_app/Add/homeTopWidget.dart';
import 'package:delivery_app/Add/searchBar.dart';
import 'package:flutter/material.dart';

//First page of bottom navigation bar present in mainsceen first page when the user signin or signup

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final List<FoodData> _foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
        children: <Widget>[ 
          HomeTopWidget(),
          SizedBox(
            height: 15.0,
          ),
          SearchBar(),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequently Delivered items",//when tapped shows(unimplemented) frequently delivered items that can be delivered
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View All",//when tapped shows(unimplemented) all the items can be delivered
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.orangeAccent),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(

          )
        ],
      ),
    );
  }

}
