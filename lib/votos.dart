import 'package:flutter/material.dart';

class CalcularVotos extends StatefulWidget {
  const CalcularVotos({super.key, required this.title});

  final String title;

  @override
  State<CalcularVotos> createState() => _CalcularVotos();
}

class _CalcularVotos extends State<CalcularVotos> {
  double votosValidos = 0;
  double votosNulos = 0;
  double votosBrancos = 0;
  double total = 0;


  void calcularVotos() {
    total = votosValidos + votosNulos + votosBrancos;

    setState(() {
      votosValidos = votosValidos / total * 100;
      votosNulos = votosNulos / total * 100;
      votosBrancos = votosBrancos / total * 100;
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container( padding: const EdgeInsets.all(10),
          child: Column( children: <Widget>[ 
            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                votosValidos = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Votos Válidos', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
            ),

            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                votosNulos = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Votos Nulos', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
            ),

            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                votosBrancos = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Votos Brancos', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
            ),

            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( padding: const EdgeInsets.all(10),
                child: 
                    Text('$votosValidos% de votos válidos.', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25)),
                ),

                Container( padding: const EdgeInsets.all(10),
                child: 
                    Text('$votosNulos% de votos nulos.', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25)),
                ),

                Container( padding: const EdgeInsets.all(10),
                child: 
                    Text('$votosBrancos% de votos brancos.', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25)),
                ),

                
              ],

            ),
          ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calcularVotos,
        tooltip: 'Calcular Votos!',
        child: const Icon(Icons.thumb_up_sharp),
      )
    );
  }
}