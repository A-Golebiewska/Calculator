import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget{
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Easy Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
 class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
   State<MyHomePage> createState() => _MyHomePageState();
 }

class _MyHomePageState extends State<MyHomePage> {
final TextEditingController _controller1 = TextEditingController();
final TextEditingController _controller2 = TextEditingController();
String _result = '';
 void _calculate(String operator){
   final num1 = double.tryParse(_controller1.text);
   final num2 = double.tryParse(_controller2.text);

   if(num1 == null || num2 == null){
     setState(() {
       _result = 'Podaj prawidłowe liczby';
     });
     return;
   }
   double? res;
   String _resulttext = '';
  switch (operator) {
    case '+':
      res = num1 + num2;
      _resulttext = 'Wynik to $res';
      break;
    case '-':
      res = num1 - num2;
      _resulttext = 'Wynik to $res';
      break;
    case '*':
      res = num1 * num2;
      _resulttext = 'Wynik to $res';
      break;
    case '/':
      if(num2 == 0){
        _result = 'Błąd: dzielenie przez 0';
        setState(() {});
        return;
      }
      res = num1 / num2;
      _resulttext = 'Wynik to $res';
      break;
    case '%':
      res = (num1 *num2)/100;
      _resulttext = 'Wynik to $res%';
      break;
    case '^':
      res = pow(num1, num2) as double?;
      _resulttext = 'Wynik to $res';
      break;
    case 'C':
      _controller1.clear();
      _controller2.clear();
      _resulttext = '';
    default:
      res = 0;
      _resulttext = 'Wynik to $res';
  }
  setState(() {
    _result = _resulttext;
  });
}
 @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text(widget.title),
     ),
     body: Padding(
       padding: EdgeInsets.all(15.0),
       child: Column(
         children: [
           TextField(
             controller: _controller1,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(labelText: 'First number'),
           ),
           TextField(
             controller: _controller2,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(labelText: 'Second number'),
           ),
           SizedBox(height: 20),
           Wrap(
             spacing: 25,
             children: ['+', '-', '*', '/', '%','^', 'C'].map((op) {
               return ElevatedButton(
                   onPressed: () => _calculate(op),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blueAccent[100],
                   foregroundColor: Colors.white,
                 ),
                 child: Text(op),
               );
             }).toList(),
           ),
           SizedBox(height: 30),
           Text(
             _result,
             style: TextStyle(fontFamily: 'Time New Roman', fontStyle: FontStyle.italic, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
           )
         ],
       ),
     ),
   );
  }
}


