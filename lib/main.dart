import 'package:flutter/material.dart';

void main() => runApp(const MojeAppka());

class MojeAppka extends StatelessWidget {
  const MojeAppka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PocitadloStranka(),
    );
  }
}

class PocitadloStranka extends StatefulWidget {
  const PocitadloStranka({super.key});

  @override
  _PocitadloStrankaState createState() => _PocitadloStrankaState();
}

class _PocitadloStrankaState extends State<PocitadloStranka> {
  int _pocet = 0; // Proměnná, která drží číslo

  void _zvysitCislo() {
    setState(() {
      _pocet++; // Zvětší číslo o 1 a překreslí obrazovku
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje Flutter Appka'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Počet kliknutí:', style: TextStyle(fontSize: 18)),
            Text(
              '$_pocet', 
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _zvysitCislo,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}