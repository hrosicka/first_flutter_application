import 'package:flutter/material.dart';

void main() {
  runApp(const MojeAplikace());
}

class MojeAplikace extends StatefulWidget {
  const MojeAplikace({super.key});

  @override
  State<MojeAplikace> createState() => _MojeAplikaceState();
}

class _MojeAplikaceState extends State<MojeAplikace> {
  int pocitadlo = 0; // Tady ukládáme číslo

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Moje První Appka')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Kliknul jsi tolikrát:'),
              Text('$pocitadlo', style: const TextStyle(fontSize: 40)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              pocitadlo++; // Přičte 1 a překreslí obrazovku
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}