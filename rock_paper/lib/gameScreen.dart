import 'package:flutter/material.dart';
import 'package:rockpaper/Test.dart';
import 'package:rockpaper/cpuLogic.dart';
import 'package:rockpaper/main.dart';
import 'package:rockpaper/winnerLogic.dart';

class GameScreen extends StatefulWidget {
  String userImage;
  int userChoice;
  GameScreen(this.userImage, this.userChoice);
  CpuChoice cpuChoice = CpuChoice();

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  WinnerLogic winnerLogic = WinnerLogic();
  CpuChoice cpuChoice = CpuChoice();
  Test test = Test();

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
      padding: const EdgeInsets.all(10.0),
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

  String writeWinner() {
    if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 0) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 1) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 2)) {
      return text = "You manage a Draw game, pathetic.";
    } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 1) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 2) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 0)) {
      // cpuScore++;
      return text = "I know you're better than that, but this time You Lose !!";
    } else if ((widget.userChoice == 0 && cpuChoice.cpuRandomNumber == 2) ||
        (widget.userChoice == 1 && cpuChoice.cpuRandomNumber == 0) ||
        (widget.userChoice == 2 && cpuChoice.cpuRandomNumber == 1)) {
      // userScore++;
      return text = "Finally the target it's reached, You Won !!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Rock Paper Scissors")),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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

              // Container(
              //   child: Text("Ce ai facut> $text"),
              // ),
              Container(child: won()),
              Container(
                child: RaisedButton(
                  // shape: ShapeBorder(),
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => MyApp()));
                      winnerLogic.reset();
                    });
                  },
                  child: Text("Restart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}