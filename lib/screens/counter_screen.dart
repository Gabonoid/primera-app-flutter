import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;

  // Creando funciones para pasr por argumento
  void incrementar() => setState(() => contador++);
  void resetear() => setState(() => contador = 0);
  void restar() => setState(() => contador--);

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador de Clicks', style: fontSize30),
            Text('$contador', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFLoatingActions(
        sumarFn: incrementar,
        resetearFn: resetear,
        restarFn: restar,
      ),
    );
  }
}

class CustomFLoatingActions extends StatelessWidget {
  final Function sumarFn;
  final Function resetearFn;
  final Function restarFn;

  const CustomFLoatingActions({
    super.key,
    required this.sumarFn,
    required this.resetearFn,
    required this.restarFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => restarFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero),
          onPressed: () => resetearFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () => sumarFn(),
        ),
      ],
    );
  }
}
