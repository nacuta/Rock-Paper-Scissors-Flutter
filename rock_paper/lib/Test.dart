import 'package:flutter/material.dart';

class Test {
  List<String> images = ["rock", "paper", "scissors"];
  Test() {
    print(this.images);
  }
}
// http://developine.com/flutter-full-screen-splash-screen-tutorial/
//  child: SafeArea(
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(8.0),
//               padding: EdgeInsets.all(16.0),
//               child: SizedBox(
//                 width: 150,
//                 child: ListView(
//                   children: <Widget>[
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: test.images
//                           .asMap()
//                           .entries
//                           .map((MapEntry map) => showOptions(map.key))
//                           .toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
