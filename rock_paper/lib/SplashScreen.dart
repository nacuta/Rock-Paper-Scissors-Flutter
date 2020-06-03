import 'dart:async';
import 'package:rockpaper/main.dart';

import 'package:flutter/material.dart';
import 'package:rockpaper/Test.dart';
import 'package:rockpaper/cpuLogic.dart';
import 'package:rockpaper/gameScreen.dart';
import 'package:rockpaper/winnerLogic.dart';

class SplashScreen extends StatefulWidget {
  String userImage;
  int userChoice;
  SplashScreen(this.userImage, this.userChoice);
  @override                         
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen> {
    WinnerLogic winnerLogic = WinnerLogic();
  CpuChoice cpuChoice = CpuChoice();
  Test test = Test();
route() {
  int  winner = writeWinner();
  print (winner);
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => GameScreen(winner)
    )
  ); 
}
  startTime() async {
  var duration = new Duration(seconds: 2);
  return new Timer(duration, route);
}
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    startTime();
  }
  Widget userWidget() {
    String image = widget.userImage;
    return Container(
      child: FlatButton(
        // color: color,
        onPressed: () {
          setState(() {});
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/$image.png",
                width: 180,
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cpuWidget() {
    String image = test.images[cpuChoice.cpuRandomNumber];
    return Container(
      child: FlatButton(
        // color: color,
        onPressed: () {
          setState(() {});
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/$image.png",
                width: 180,
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String text;
  Widget won() {
    writeWinner();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(' $text',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: 30)),
      ),
    );
  }

 int writeWinner() {
   int winner ;
    if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 0) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 1) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 2)) {
      return winner = 0;// "You manage a Draw game, pathetic.";
    } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 1) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 2) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 0)) {
      // cpuScore++;
      return winner = cpuChoice.cpuRandomNumber;// "I know you're better than that, but this time You Lose !!";
    } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 2) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 0) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 1)) {
      // userScore++;
      return winner = widget.userChoice;// "Finally the target it's reached, You Won !!";
    }
    return winner;
  }
  
  initScreen(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            userWidget(),
            Center(
              child: Text(
                "VS",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            cpuWidget(),

           
            
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}
