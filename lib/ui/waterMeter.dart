import 'package:flutter/material.dart';
import 'dart:math';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WaterMeter extends StatelessWidget {
  int waterTaken;
  int waterNeed;
  WaterMeter(int waterTaken, int waterNeed) {
    this.waterTaken = waterTaken;
    this.waterNeed = waterNeed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '0 ML'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "$waterNeed ML".toUpperCase(),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: min(waterTaken/waterNeed, 1),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor:
                Theme.of(context).accentColor.withAlpha(30),
            progressColor: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Text(
            'Water Drank'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontFamily: 'Bebas',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Just '+(max(waterNeed-waterTaken, 0)).toString()+'ML more today!',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}