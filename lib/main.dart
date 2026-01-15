import 'package:flutter/material.dart';

void main() => runApp(const MojeAppka());

class MojeAppka extends StatelessWidget {
  const MojeAppka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const PocitadloStranka(),
    );
  }
}

class PocitadloStranka extends StatefulWidget {
  const PocitadloStranka({super.key});

  @override
  _PocitadloStrankaState createState() => _PocitadloStrankaState();
}

class _PocitadloStrankaState extends State<PocitadloStranka> {
  int _pocet = 0;

  void _zmenitCislo(int hodnota) {
    setState(() {
      _pocet += hodnota;
      if (_pocet < 0) _pocet = 0; // Zamezíme záporným číslům
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamická barva: pokud je > 10, bude zelená, jinak hluboce fialová
    Color barvaCisla = _pocet >= 10 ? Colors.green : Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje Vylepšená Appka'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text('Aktuální stav:', style: TextStyle(fontSize: 16)),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        // Skvělý efekt: kombinace zvětšení (Scale) a průhlednosti (Fade)
                        return ScaleTransition(
                          scale: animation,
                          child: FadeTransition(opacity: animation, child: child),
                        );
                      },
                      child: Text(
                        '$_pocet',
                        // Klíč je kriticky důležitý pro spuštění animace!
                        key: ValueKey<int>(_pocet), 
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: barvaCisla,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _zmenitCislo(-1),
                  icon: const Icon(Icons.remove),
                  label: const Text('Odebrat'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () => _zmenitCislo(1),
                  icon: const Icon(Icons.add),
                  label: const Text('Přidat'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _pocet = 0),
        tooltip: 'Resetovat',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}