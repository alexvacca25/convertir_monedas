import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  /*
            0-COP     1-USD     2-EUR
    
    0-COP     1       4000      5000

    1-USD   0.00025     1       0.98

    2-EUR   0.0002     0.98      1
  
  */

  List<List<double>> factor = [
    [1, 4000, 5000],
    [0.00025, 1, 0.98],
    [0.0002, 0.98, 1]
  ];
  List<String> listamoneda = ['COP', 'USD', 'EUR'];
  int cO = 0;
  int cD = 0;
  TextEditingController divO = TextEditingController(text: "0.0");
  TextEditingController divD = TextEditingController(text: "0.0");

  void insertarnumeros(String numero) {
    divO.text = divO.text + numero;
    convertir();
    print('Factor: ${factor[cD][cO]}');
  }

  void convertir() {
    divD.text = (double.parse(divO.text) * factor[cD][cO]).toString();
  }

  void monedaorigen() {
    cO < 2 ? cO++ : cO = 0;
    print(cO);
    print(listamoneda[cO]);
    convertir();
    setState(() {});
  }

  void monedadestino() {
    cD < 2 ? cD++ : cD = 0;
    print(cD);
    print(listamoneda[cD]);
    convertir();
    setState(() {});
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Moneda Origen'),
                GestureDetector(
                    onTap: () => monedaorigen(),
                    child: Monedas(valor: listamoneda[cO])),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center, //alineacion del texto
              controller: divO,
              decoration: const InputDecoration(
                  hintText: '0.0'), // Valor por defecto cuando no hay datos
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Conversion en '),
                GestureDetector(
                    onTap: () => monedadestino(),
                    child: Monedas(valor: listamoneda[cD]))
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: divD,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => insertarnumeros('7'),
                  child: const Numeros(
                    valor: '7',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('8'),
                  child: const Numeros(
                    valor: '8',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('9'),
                  child: const Numeros(
                    valor: '9',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => insertarnumeros('4'),
                  child: const Numeros(
                    valor: '4',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('5'),
                  child: const Numeros(
                    valor: '5',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('6'),
                  child: const Numeros(
                    valor: '6',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => insertarnumeros('1'),
                  child: const Numeros(
                    valor: '1',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('2'),
                  child: const Numeros(
                    valor: '2',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('3'),
                  child: const Numeros(
                    valor: '3',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    divO.clear();
                    divD.clear();
                  },
                  child: const Numeros(
                    valor: 'C',
                  ),
                ),
                GestureDetector(
                  onTap: () => insertarnumeros('0'),
                  child: const Numeros(
                    valor: '0',
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: const Numeros(
                    valor: '<',
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

class Monedas extends StatelessWidget {
  final String valor;
  const Monedas({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 40,
        color: valor == 'COP'
            ? Colors.yellow
            : valor == 'USD'
                ? Colors.green
                : Colors.blueGrey,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
