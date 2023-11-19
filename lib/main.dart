import 'package:flutter/material.dart';
import 'package:tuesday_flutter/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '8',
    '9',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: GridView.builder(
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return MyButton(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = '';
                                  });
                                },
                                color: Colors.green,
                                textColor: Colors.white,
                                buttonText: buttons[index]);
                          }
                          if (index == 1) {
                            return MyButton(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = userQuestion.substring(0 , userQuestion.length - 1);
                                  });
                                },
                                color: Colors.red,
                                textColor: Colors.white,
                                buttonText: buttons[index]);
                          } else {
                            return MyButton(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                },
                                color: isOperator(buttons[index])
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[50],
                                textColor: isOperator(buttons[index])
                                    ? Colors.white
                                    : Colors.deepPurple,
                                buttonText: buttons[index]);
                          }
                        })),
              ))
        ],
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == '%' ||
      x == 'x' ||
      x == '-' ||
      x == '+' ||
      x == '=' ||
      x == '/' ||
      x == 'X') {
    return true;
  } else {
    return false;
  }
}
