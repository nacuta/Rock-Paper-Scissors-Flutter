import 'package:rockpaper/cpuLogic.dart';

class WinnerLogic {
  CpuChoice cpuChoice = CpuChoice();

  int userScore = 0;
  int cpuScore = 0;
  int draw = 0;
  int userChoice;
  int cpuChoicefo;
  int wesa;

  void reset() {
    userScore = 0;
    cpuScore = 0;
  }

  get getUserChoice => userChoice;

  // void get getuserChoice => userChoice;
  set setUserhoice(int position) => userChoice = position;
}
