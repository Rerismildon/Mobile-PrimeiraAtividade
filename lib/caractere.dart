import 'package:flutter/material.dart';

class ContadorDeCaractere extends StatefulWidget {
  const ContadorDeCaractere({super.key, required this.title});

  final String title;

  @override
  State<ContadorDeCaractere> createState() => _ContadorDeCaractere();
}

class _ContadorDeCaractere extends State<ContadorDeCaractere> {
  String palavra = "";
  String caracter = "";
  String quantidade = "";

  void contarCaractere() {
    int count  = 0;

    for (int i=0; i < palavra.length; i++){
      if (palavra[i] == caracter){count++;}
    }

    setState(() {
      quantidade = "Há $count \"$caracter\" em $palavra";
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
                palavra = texto;
              },
              decoration: const InputDecoration(labelText: 'Digite Sua Palavra', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20
                ), 
              ),
          ),

          Container( padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto) {
                caracter = texto;
              },
              decoration: const InputDecoration(
                labelText: 'Caractere Desejado', border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red, width: 5.0
                    )
                  )
                ),
              style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20
                ), 
              ),
          ),
            
          Container( padding: const EdgeInsets.all(10),
            child: 
              Text('${quantidade}', style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25
                )
                ),
          ),
        ],),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: contarCaractere,
        tooltip: 'Contar Caractere!',
        child: const Icon(Icons.thumb_up_sharp),
      )
    );
  }
}


