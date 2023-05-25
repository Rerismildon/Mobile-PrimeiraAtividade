import 'package:flutter/material.dart';

class Fruteira extends StatefulWidget {
  const Fruteira({super.key, required this.title});

  final String title;

  @override
  State<Fruteira> createState() => _Fruteira();
}

class _Fruteira extends State<Fruteira> {
  List pesos = [0.0, 0.0];
  double preco = 0;
  String preco2 = '';



  void calcularPreco() {
    preco = 0;

    setState(() {
      if (pesos[0] < 5){preco = pesos[0] * 2.5;}
      else {preco = pesos[0] * 2.2;}

      if (pesos[1] < 5){preco = preco + (pesos[1] * 1.8);}
      else {preco = preco + (pesos[1] * 1.5);}

      if (((pesos[0] + pesos[1]) >= 8) || (preco >= 25)){preco = preco - (preco/10);}

    preco2 = "Você irá pagar R\$ ${preco.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container( padding: const EdgeInsets.all(10),
        child: Column( children: <Widget>[ 
          Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                pesos[0] = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Pesos dos morangos', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
          ),

          Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                pesos[1] = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Pesos das maçãs', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
          ),
            
          Container( padding: const EdgeInsets.all(10),
            child: 
              Text('$preco2', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25)),
          ),
        ],),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: calcularPreco,
        tooltip: 'Calcular Preço!',
        child: const Icon(Icons.thumb_up_sharp),
      )
    );
  }
}


