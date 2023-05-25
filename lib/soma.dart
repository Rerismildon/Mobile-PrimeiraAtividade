import 'package:flutter/material.dart';

class SomarDias extends StatefulWidget {
  const SomarDias({super.key, required this.title});

  final String title;

  @override
  State<SomarDias> createState() => _SomarDiasState();
}

class _SomarDiasState extends State<SomarDias> {
  int dias = 0;

  String dia = '';
  String mes = '';
  String ano = '';

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  void CalcularIdade() {
    setState(() {
      dias = (int.parse(dia) + (int.parse(mes) * 30) + (int.parse(ano) * 365));
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container( padding: const EdgeInsets.all(10),
        child:Center(
          child: Column(
          children: <Widget>[
            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller1,
              onChanged: (texto) {
                dia = texto;
              },
              decoration: const InputDecoration(labelText: 'Dias de vida', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              )
            ),

            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller2,
              onChanged: (texto) {
                mes = texto;
              },
              decoration: const InputDecoration(labelText: 'Mês de vida', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
            ),

            Container( padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller3,
              onChanged: (texto) {
                ano = texto;
              },
              decoration: const InputDecoration(labelText: 'Anos de vida', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20), 
              ),
            ),

            Container( padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: CalcularIdade,
              child: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              
              ),
            ),

            Container( padding: const EdgeInsets.all(10), child:
              Text('$dias dias de vida', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 50)),
            ),
          ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CalcularIdade,
        tooltip: 'Calcular Resultado!',
        child: const Icon(Icons.thumb_up_sharp),
      )
    );
  }
}