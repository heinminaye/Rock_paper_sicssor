import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imgListO = ['paper', 'rock', 'scissor'];
  String M = 'rock';
  List imgListT = ['scissor', 'paper', 'rock'];
  String firstImg = '';
  String secondImg = '';
  String thirdImg = '';
  String fourthImg = '';
  var selectImg = 'rock';

  void startList() {
    setState(() {
      imgListT.shuffle();
      fourthImg = imgListT[1];
    });
  }

  void check() {
    if (selectImg == 'rock' && fourthImg == 'scissor') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Yay! You win'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'rock' && fourthImg == 'rock') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Draw!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'rock' && fourthImg == 'paper') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Sry! You lose'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (selectImg == 'paper' && fourthImg == 'rock') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Yay! You win'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'paper' && fourthImg == 'paper') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Draw!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'paper' && fourthImg == 'scissor') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Sry! You lose'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (selectImg == 'scissor' && fourthImg == 'paper') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Yay! You win'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'scissor' && fourthImg == 'scissor') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Draw!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectImg == 'scissor' && fourthImg == 'rock') {
      const snackBar = SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text('Sry! You lose'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    firstImg = imgListO[0];
    secondImg = imgListO[1];
    thirdImg = imgListO[2];

    fourthImg = imgListT[2];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 100,
                ),
                Image.asset(
                  'images/$selectImg.png',
                  width: 100,
                ),
                const SizedBox(
                  width: 100,
                ),
                Transform(
                  transform: Matrix4.rotationY(math.pi),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/$fourthImg.png',
                        width: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectImg = imgListO[0];
                    });
                  },
                  child: Image.asset(
                    'images/$firstImg.png',
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectImg = imgListO[1];
                    });
                  },
                  child: Image.asset(
                    'images/$secondImg.png',
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectImg = imgListO[2];
                    });
                  },
                  child: Image.asset(
                    'images/$thirdImg.png',
                    width: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startList();
                  },
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    check();
                  },
                  child: Text('Chcek'),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
