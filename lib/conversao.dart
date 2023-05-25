import 'package:flutter/material.dart';

class ConverterTemp extends StatefulWidget {
  const ConverterTemp({super.key, required this.title});

  final String title;

  @override
  State<ConverterTemp> createState() => _ConverterTemp();
}

enum TempSelector { celsius, fahrenheit }

class _ConverterTemp extends State<ConverterTemp> {
  TempSelector? _character = TempSelector.celsius;

  double temperatura = 0.0;
  bool celsius = true;
  String textTemp = '';

  void converterTemp() {
    if (_character == TempSelector.celsius) {
      setState(() {
        temperatura = (temperatura - 32) * 5 / 9; //Para celsius
        textTemp = "$temperatura Celsius.";
        temperatura = 0;
      });
    }
    else {
      setState(() {
        temperatura = (temperatura / 5 * 9) + 32;
        textTemp = "$temperatura Fahrenheit."; // Para fahrenheit
        temperatura = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container( padding: const EdgeInsets.all(10),
        child: Column( children: <Widget>[ 
          Container(padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (texto){
                temperatura = double.parse(texto);
              },
              decoration: const InputDecoration(labelText: 'Temperatura', border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5.0))),
              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 20),
            )
          ),

          Container( padding: const EdgeInsets.all(10),
            child: 
              Text('$textTemp', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25)),
          ),
            
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            ListTile(
              title: const Text('Celsius'),
              leading: Radio<TempSelector>(
                value: TempSelector.celsius,
                groupValue: _character,
                onChanged: (TempSelector? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Fahrenheit'),
              leading: Radio<TempSelector>(
                value: TempSelector.fahrenheit,
                groupValue: _character,
                onChanged: (TempSelector? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],)
        ],),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: converterTemp,
        tooltip: 'Converter Temperatura!',
        child: const Icon(Icons.thumb_up_sharp),
      )
    );
  }
}


