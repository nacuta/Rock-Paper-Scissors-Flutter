import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
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
  List<String> texts = [
    "Finally the target it's reached, You Won !!",
    "I know you're better than that, but this time You Lose !!",
    "You manage a Draw game, pathetic."
  ];
  route() {
    int winner ;
    String tex;
    if (widget.userChoice == cpuChoice.cpuRandomNumber) {
      winner = 5;
      tex = texts[2];
    } else if ((widget.userChoice - cpuChoice.cpuRandomNumber) % 3 == 1) {
      tex = texts[0];
      winner = widget.userChoice;
    } else {
      tex = texts[1];
      winner = cpuChoice.cpuRandomNumber;
    }

    print(winner);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GameScreen(winner, cpuChoice.cpuRandomNumber, tex)));
  }

  startTime() async {
    playSound();
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  void playSound() {
    final player = AudioCache();
    player.play('swords.wav');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
          setState(() {
            playSound();
          });
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

  // Widget won() {
  //   int winner = writeWinner();
  //   if (widget.userChoice == winner) {
  //     return Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Text(' $texts[0]',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 color: Colors.grey[800],
  //                 fontWeight: FontWeight.w900,
  //                 fontStyle: FontStyle.italic,
  //                 fontFamily: 'Open Sans',
  //                 fontSize: 30)),
  //       ),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Text(' $texts[1]',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 color: Colors.grey[800],
  //                 fontWeight: FontWeight.w900,
  //                 fontStyle: FontStyle.italic,
  //                 fontFamily: 'Open Sans',
  //                 fontSize: 30)),
  //       ),
  //     );
  //   }
  // }

  // int writeWinner() {
  //   int winner;
  //   if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 0) ||
  //       (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 1) ||
  //       (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 2)) {
  //     return winner = 5; // "You manage a Draw game, pathetic.";
  //   } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 1) ||
  //       (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 2) ||
  //       (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 0)) {
  //     // cpuScore++;
  //     return winner = cpuChoice
  //         .cpuRandomNumber; // "I know you're better than that, but this time You Lose !!";
  //   } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 2) ||
  //       (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 0) ||
  //       (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 1)) {
  //     // userScore++;
  //     return winner =
  //         widget.userChoice; // "Finally the target it's reached, You Won !!";
  //   }
  //   return winner;
  // }

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
