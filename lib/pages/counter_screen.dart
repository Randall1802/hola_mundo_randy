import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  //propiedades del widget. las q haya required seran de a webo.

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

//como es stateful maneja ese estado
class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    //widget que ya nos da ciertas propiedades pa q se vea bien la app, caract visuales.
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              //podemos dar propiedades
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w400,
                  color: Colors.amber),
            ),
            Text(
              'clic${contador == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
      //este nos va a crear abajo botones. lo envolvemos en una columna en la esquina derecha
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icono: Icons.plus_one_outlined,
            //evento anonimo pq no tiene name
            onPressed: () {
              //es para cambiar el estado de la variable. 
              setState(() {
                //al parecer esto va dentro del onpressed pero fuera del setstate.
                contador++;
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
            icono: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {});
              if (contador <= 0) {
                contador = 0;
              } else {
                contador--;
              }
              //if (contador == 0) return;
              //contador--;
            },
          ),
          SizedBox(
            height: 5,
          ),
          CustomButton(
            icono: Icons.refresh_sharp,
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
          )
        ],
      ),
    ); //Text('Contador');
  }
}

//otro widget con 2 propiedades
class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    //retorna eso porque lo hicimos asi arriba
    return FloatingActionButton(
      //pa hacerlo redondo
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}
