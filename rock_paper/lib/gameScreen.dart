import 'package:flutter/material.dart';
import 'package:rockpaper/Test.dart';
import 'package:rockpaper/cpuLogic.dart';
import 'package:rockpaper/main.dart';
import 'package:rockpaper/winnerLogic.dart';

class GameScreen extends StatefulWidget {
  dynamic userImage;
  int userChoice;
  GameScreen(this.userImage, this.userChoice);

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  WinnerLogic winnerLogic = WinnerLogic();
 
  Test test = Test();
String text;
String image;

    Widget isWinner() {
      
    if (widget.userImage == 5) {
       String userimage = test.images[widget.userChoice];
       String cpuimage = userimage;
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
                "assets/$userimage.png",
                width: 180,
                height: 180,
              ),
               Image.asset(
                "assets/$cpuimage.png",
                width: 180,
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );;
    } else {
     image = test.images[widget.userImage];
       return Container(
      child: FlatButton(
        // color: color,
        onPressed: () { 
          var test = isWinner();
    print(test);
    // print(image);
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
  }
 

  
  Widget won() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(' ceva',
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

  Widget veerticalLayout() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            isWinner(),
            // Center(
            //   child: Text(
            //     "VS",
            //     style: TextStyle(
            //       fontSize: 24,
            //       color: Colors.blue,
            //       fontWeight: FontWeight.w900,
            //     ),
            //   ),
            // ),
            // cpuWidget(),

            // Container(
            //   child: Text("Ce ai facut> $text"),
            // ),
            // Container(child: won()),
            Container(
              child: RaisedButton(
                color: Colors.greenAccent,
                elevation: 5.0,
                padding: EdgeInsets.all(
                    20.0), //distance of all the sides to the //child

                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black),
                ),
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
    );
  }

  Widget hoorizontalLayout() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                isWinner(),
                // Center(
                //   child: Text(
                //     "VS",
                //     style: TextStyle(
                //       fontSize: 24,
                //       color: Colors.blue,
                //       fontWeight: FontWeight.w900,
                //     ),
                //   ),
                // ),
                // cpuWidget(),
                Column(
                  children: [
                    Container(width: 250, child: won()),
                    Container(
                      // width: 400.0,
                      child: RaisedButton(
                        color: Colors.greenAccent,
                        elevation: 5.0,
                        padding: EdgeInsets.all(
                            20.0), //distance of all the sides to the //child

                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => MyApp()));
                            winnerLogic.reset();
                          });
                        },
                        child: Text("Restart"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("Rock Paper Scissors")),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? veerticalLayout()
                : hoorizontalLayout();
          },
        ),
      ),
    );
  }
}
