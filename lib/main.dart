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

  String input = '';
  String output = '';

  void click(String text) {
    setState(() => {output += text});
  }

  void allClear(String text) {
    setState(() {
      input = '';
      output = '';
    });
  }

  void clear(String text) {
    setState(() {
      output = output.substring(0,output.length-1);
      // output = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(output);
    ContextModel cm = ContextModel();

    setState(() {
      input = output;
      output = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(input.toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54
                      ),
                    ),
                    Text(output.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                    ),
                ),
              ),

                const Divider(thickness: 1,),

                Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(textColor: Colors.indigo, text: 'AC',textSize: 24, onPress: allClear),
                        MyButton(textColor: Colors.indigo, text: 'C',textSize: 24, onPress: clear,),
                        MyButton(textColor: Colors.indigo, text: '%', onPress: click),
                        MyButton(textColor: Colors.indigo, text: '/', onPress: click)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(text: '7', onPress: click),
                        MyButton(text: '8', onPress: click),
                        MyButton(text: '9', onPress: click),
                        MyButton(textColor: Colors.indigo, text: '*',textSize: 40, onPress: click)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(text: '4', onPress: click),
                        MyButton(text: '5', onPress: click),
                        MyButton(text: '6', onPress: click),
                        MyButton(textColor: Colors.indigo, text: '-',textSize: 40, onPress: click)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(text: '1', onPress: click),
                        MyButton(text: '2', onPress: click),
                        MyButton(text: '3', onPress: click),
                        MyButton(textColor: Colors.indigo, text: '+',textSize: 30, onPress: click)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(text: '.', onPress: click),
                        MyButton(text: '0', onPress: click),
                        MyButton(text: '00', onPress: click),
                        MyButton(textColor: Colors.white, text: '=', btnColor: Colors.indigo, onPress: evaluate)
                      ],
                    ),
                  ],
                ),
              )
        ]
            ),
          ),

      ),
    );
  }




}
