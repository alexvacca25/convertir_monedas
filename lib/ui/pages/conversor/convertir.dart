import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController divO = TextEditingController();
  TextEditingController divD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion de Monedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text('Valor a Convertir'),
            TextField(
              textAlign: TextAlign.center, //alineacion del texto
              controller: divO,
              decoration: const InputDecoration(
                  hintText: '0.0'), // Valor por defecto cuando no hay datos
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Conversion en'),
            TextField(
              textAlign: TextAlign.center,
              controller: divD,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Numeros(
                  valor: '7',
                ),
                Numeros(
                  valor: '8',
                ),
                Numeros(
                  valor: '9',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Numeros extends StatelessWidget {
  final String valor;
  const Numeros({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        color: Colors.blue,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
