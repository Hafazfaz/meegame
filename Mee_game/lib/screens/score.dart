import 'package:flutter/material.dart';
import 'package:quiz_game/home.dart';

class ScoreScreen extends StatefulWidget {
  final int score;
  const ScoreScreen(this.score, {super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color.fromARGB(255, 97, 108, 160);
    Color secondColor = Color(0xFF117eeb);

    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 37.9,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Your total score is :",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.9,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 50.0),
            Text(
              "${widget.score}",
              style: TextStyle(
                color: Color.fromARGB(255, 39, 202, 34),
                fontSize: 78.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 59.9,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              elevation: 0.0,
              color: Color.fromARGB(255, 25, 106, 182),
              textColor: Colors.white,
              child: Text("Repeat the Challenge"),
            )
          ],
        ),
      ),
    );
  }
}
