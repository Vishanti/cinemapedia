import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = <String>[
      'Cargando Peliculas',
      'Comprando palomitas de maíz',
      'Cargando Polular',
      'Cargando Mejores calificadas',
    ];

    Stream<String> getLoadingMessages() {
      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando....');
                return Text(snapshot.data!);
              },
              stream: getLoadingMessages())
        ],
      ),
    );
  }
}
