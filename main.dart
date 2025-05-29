import 'package:flutter/material.dart';

void main() {
  runApp(CliqueLucroApp());
}

class CliqueLucroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clique & Lucro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _clicks = 0;
  int _points = 0;
  int _adsWatchedToday = 0;
  final int _maxAdsPerDay = 10;

  void _handleClick() {
    setState(() {
      _clicks++;
      if (_clicks % 5 == 0) {
        // Mostrar anúncio intersticial aqui (exemplo)
        print("Mostrar anúncio intersticial");
      }
      if (_clicks % 10000 == 0) {
        _points += 100; // Exemplo: a cada 10k cliques, 100 pontos
      }
    });
  }

  void _watchAd() {
    if (_adsWatchedToday >= _maxAdsPerDay) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Limite diário de anúncios assistidos atingido.")));
      return;
    }
    setState(() {
      _adsWatchedToday++;
      _points += 5;
      print("Usuário assistiu anúncio recompensado.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clique & Lucro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Cliques: $_clicks"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleClick,
              child: Text("Clique aqui"),
            ),
            SizedBox(height: 10),
            Text("Pontos: $_points"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _watchAd,
              child: Text("Assistir anúncio (+5 pontos)"),
            ),
            SizedBox(height: 10),
            Text("Anúncios assistidos hoje: $_adsWatchedToday/$_maxAdsPerDay"),
          ],
        ),
      ),
    );
  }
}