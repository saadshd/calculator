import 'package:flutter/material.dart';
import 'buttonwidget.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String previous = '';
  String value = '';

  void click(String text) {
    setState(() => {value += text});
  }

  void allclear(String text) {
    setState(() {
      previous = '';
      value = '';
    });
  }

  void clear(String text) {
    setState(() {
      value = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(value);
    ContextModel cm = ContextModel();

    setState(() {
      previous = value;
      value = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(previous,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54
                    ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(value,
                      style: TextStyle(
                      fontSize: 48,
                    ),

                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button(textcolor: Colors.indigo, text: 'AC',textsize: 24, onPress: allclear),
                  button(textcolor: Colors.indigo, text: 'C',textsize: 24, onPress: clear),
                  button(textcolor: Colors.indigo, text: '%', onPress: click),
                  button(textcolor: Colors.indigo, text: '/', onPress: click)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(text: '7', onPress: click),
                button(text: '8', onPress: click),
                button(text: '9', onPress: click),
                button(textcolor: Colors.indigo, text: '*',textsize: 40, onPress: click)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(text: '4', onPress: click),
                button(text: '5', onPress: click),
                button(text: '6', onPress: click),
                button(textcolor: Colors.indigo, text: '-',textsize: 40, onPress: click)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(text: '1', onPress: click),
                button(text: '2', onPress: click),
                button(text: '3', onPress: click),
                button(textcolor: Colors.indigo, text: '+',textsize: 30, onPress: click)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(text: '.', onPress: click),
                button(text: '0', onPress: click),
                button(text: '00', onPress: click),
                button(textcolor: Colors.white, text: '=', btncolor: Colors.indigo, onPress: evaluate)
              ],
            ),
          ],




        ),
      ]
        ),
      ),
    );
  }




}
