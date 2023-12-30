import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> document;

  DetailPage({required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Soura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ismsoura: ${document['ismsoura']}'),
            Text('Ayate: ${document['ayate']}'),
            Text('Idsoura: ${document['idsoura']}'),
            // Ajoutez d'autres widgets selon vos besoins
          ],
        ),
      ),
    );
  }
}
