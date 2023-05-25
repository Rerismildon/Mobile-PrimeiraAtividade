import 'package:flutter/material.dart';
import 'package:primeiro_trimestre/conversao.dart';
import 'package:primeiro_trimestre/soma.dart';
import 'package:primeiro_trimestre/votos.dart';
import 'package:primeiro_trimestre/fruteira.dart';
import 'package:primeiro_trimestre/caractere.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const Principal(title: 'My APCA'),
    );
  }
}


class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});

  final String title;

  @override
  State<Principal> createState() => _Principal();
}

class _Principal extends State<Principal> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
  


    return Scaffold(
      body: <Widget>[
        const SomarDias(title: 'Somar Os Dias De Sua Vida'),
        const CalcularVotos(title: 'Calcular A Porcentagem De Votos'),
        const ConverterTemp(title: 'Converter Temperatura (Celsius E Fahrenheit)'),
        const Fruteira(title: 'Lojinha'),
        const ContadorDeCaractere(title:  'Contador De Caractere')
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(onDestinationSelected: (value) {
        setState(() {
          currentPageIndex = value;
        });
      },
        destinations: const [
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Somar Os Dias',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Porcentagem De Votos'
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance),
          label: 'Conversor De Temperatura'
        ),
        NavigationDestination(
          icon: Icon(Icons.apple),
          label: 'Preço Das Frutas'
        ),
        NavigationDestination(
          icon: Icon(Icons.account_tree_outlined),
          label: 'Contador De Caractere'
        )
      ]),
    );
  }
}