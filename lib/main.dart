import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Pro vibrace

void main() => runApp(const MojeAppka());

class MojeAppka extends StatelessWidget {
  const MojeAppka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
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

  // Logika pro změnu čísla
  void _zmenitCislo(int hodnota) {
    setState(() {
      _pocet += hodnota;
      if (_pocet < 0) _pocet = 0;
    });
    HapticFeedback.lightImpact(); // Jemné "ťuknutí" při kliknutí
  }

  // Logika pro resetování
  void _reset() {
    setState(() => _pocet = 0);
    HapticFeedback.mediumImpact(); // Trochu silnější vibrace při resetu
  }

  @override
  Widget build(BuildContext context) {
    // Dynamická barva podle hodnoty
    Color barvaCisla = _pocet >= 10 ? Colors.green : Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje Appka'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Karta s hlavním číslem
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    Text('POČET', style: TextStyle(color: Colors.grey.shade600, letterSpacing: 2)),
                    const SizedBox(height: 10),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
                      },
                      child: Text(
                        '$_pocet',
                        key: ValueKey<int>(_pocet),
                        style: TextStyle(
                          fontSize: 85,
                          fontWeight: FontWeight.bold,
                          color: barvaCisla,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Tlačítka pro ovládání
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _KruhoveTlacitko(
                  ikona: Icons.remove,
                  barva: Colors.red,
                  onPressed: () => _zmenitCislo(-1),
                ),
                const SizedBox(width: 30),
                _KruhoveTlacitko(
                  ikona: Icons.add,
                  barva: Colors.green,
                  onPressed: () => _zmenitCislo(1),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _reset,
        label: const Text('Resetovat'),
        icon: const Icon(Icons.refresh),
        backgroundColor: Colors.deepPurple.shade100,
      ),
    );
  }
}

// Pomocný widget pro čistší kód hlavních tlačítek
class _KruhoveTlacitko extends StatelessWidget {
  final IconData ikona;
  final Color barva;
  final VoidCallback onPressed;

  const _KruhoveTlacitko({
    required this.ikona,
    required this.barva,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: barva.withOpacity(0.1),
      shape: const CircleBorder(),
      child: IconButton(
        iconSize: 40,
        icon: Icon(ikona),
        color: barva,
        onPressed: onPressed,
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}