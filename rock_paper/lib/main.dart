import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rockpaper/Test.dart';
import 'package:rockpaper/gameScreen.dart';
import 'package:rockpaper/winnerLogic.dart';
import 'SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WinnerLogic winnerLogic = WinnerLogic();
  GameScreenState secondScreen = GameScreenState();

  Test test = Test();
  // GameScreen winOrLose = GameScreen();

  bool isVisible = true;
  int clickCount = 4;

  Widget showOptions(int position) {
    String imageUser = test.images[position];
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SplashScreen(imageUser, position),
            ),
          );
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.00),
        margin: EdgeInsets.only(top: 8.00),
        decoration: BoxDecoration(
          color: clickCount == position
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Image.asset(
          "assets/$imageUser.png",
          height: 150,
          width: 150,
        ),
      ),
    );
  }
// route(){
//   setState(() {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (_) =>SplashScreen() ,
//             ),
//           );
//         });
// }
  Widget _buildVerticalLayout() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            showOptions(0),
            showOptions(1),
            showOptions(2),
            // RaisedButton(onPressed: route,
            // child: Text("Restart"),),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            showOptions(0),
            showOptions(1),
            showOptions(2),
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
        // backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text("Rock Paper Scissors")),
          backgroundColor: Theme.of(context).primaryColor,
        ),

        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildVerticalLayout()
                : _buildHorizontalLayout();
          },
        ),
      ),
    );
  }
}
