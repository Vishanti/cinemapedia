import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final List<String> messages;
  const FullScreenLoader({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
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
