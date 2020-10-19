import 'package:flutter/material.dart';

//Displayed at the top of homepage.

class HomeTopWidget extends StatelessWidget
{
  final textstyle =TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "What Would you ",
                      style: textstyle,
                    ),
                    Text(
                      "like to Deliver ?",
                      style: textstyle,
                      
                      ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none,size: 30.0,color: Theme.of(context).primaryColor,),
                  onPressed: (){},
                ),
              ],
            ),
    );
  }
  
}