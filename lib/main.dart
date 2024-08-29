import 'package:flutter/material.dart';
import 'package:hola_mundo_randy/pages/counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //widget que es pa usar el material pa la vista tipo android.
    //widgets son  constructores.
    return MaterialApp(
      title: 'Contador',
      //themedata es otra clase y constructor
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color.fromARGB(255, 255, 7, 172)),
      //otro constructor q es el widget que se ejecutara al inicio. clase q creamos, q sigue siendo un widget.
      home: CounterScreen(),
    );
  }
}
