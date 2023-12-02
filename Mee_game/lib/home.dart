import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_game/data/question_bank.dart';
import 'package:quiz_game/screens/score.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 80, 97, 173);
  Color secondColor = Color(0xFF117eeb);

  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;

  Color buttonColor = Color(0xFF252c4a);

  int score = 0;
  int currentQuestionIndex = 0;
  bool isUserTurn = true;

  // Timer variables
  late Timer _timer;
  int _timerSeconds = 5;

  // Bonus streak and coins
  int bonusStreak = 0;
  int coins = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Function to start the timer
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        // Timer expired, move to the next question
        timer.cancel();
        moveToNextQuestion();
      }
    });
  }

  // Function to reset and restart the timer
  void resetTimer() {
    setState(() {
      _timerSeconds = 5;
    });
    startTimer();
  }

  // Function to move to the next question
  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        isPressed = false;
        isUserTurn = !isUserTurn;
        if (bonusStreak > 0) {
          coins += 10 * bonusStreak; // Award coins based on bonus streak
        }
        bonusStreak = 0; // Reset bonus streak for wrong answer
      });
      resetTimer();
    } else {
      // Last question, navigate to the score screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScoreScreen(score)),
      );
    }
  }

  // Function to handle correct answer
  void handleCorrectAnswer() {
    score += 20;
    bonusStreak++; // Increment bonus streak for consecutive correct answers
    coins += 20 +
        10 * bonusStreak; // Award coins for correct answer and bonus streak
    print("Score: $score");
    print("Coins: $coins");
  }

  // Function to handle wrong answer
  void handleWrongAnswer() {
    bonusStreak = 0; // Reset bonus streak for wrong answer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display Beautiful Timer
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent, // Change color as per your preference
              ),
              child: Center(
                child: Text(
                  '$_timerSeconds',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Question ${currentQuestionIndex + 1}/${questions.length}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 8.0,
              thickness: 1.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              questions[currentQuestionIndex].question!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            for (int i = 0;
                i < questions[currentQuestionIndex].answer!.length;
                i++)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 18.0),
                child: MaterialButton(
                  shape: StadiumBorder(),
                  color: isPressed
                      ? questions[currentQuestionIndex]
                              .answer!
                              .entries
                              .toList()[i]
                              .value
                          ? isTrue
                          : isWrong
                      : secondColor,
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  onPressed: isPressed
                      ? () {}
                      : () {
                          setState(() {
                            isPressed = true;
                          });
                          _timer.cancel(); // Cancel the timer on button press
                          if (questions[currentQuestionIndex]
                              .answer!
                              .entries
                              .toList()[i]
                              .value) {
                            handleCorrectAnswer();
                          } else {
                            handleWrongAnswer();
                          }
                          // Move to the next question after a delay
                          Future.delayed(Duration(seconds: 2), () {
                            moveToNextQuestion();
                          });
                        },
                  child: Text(
                    questions[currentQuestionIndex].answer!.keys.toList()[i],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: isPressed
                      ? () {
                          moveToNextQuestion();
                        }
                      : null,
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.orange, width: 1.0),
                  ),
                  child: Text(
                    "Next Question",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
