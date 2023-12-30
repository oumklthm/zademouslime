import 'package:flutter/material.dart';

class Edkar extends StatefulWidget {
  const Edkar({Key? key}) : super(key: key);

  @override
  State<Edkar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Edkar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(135, 201, 255, 1),
          title: const Text('Edkar'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 400,
              width: 350,
              margin: const EdgeInsets.fromLTRB(50, 30, 50, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 27, 143, 137),
                  width: 3,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Text("Résultat de la ",
                  //     style: TextStyle(
                  //       fontSize: 24,
                  //       fontStyle: FontStyle.normal,
                  //     )),
                  SizedBox(height: 5), // Espace entre les deux parties du contenu
                  // Contenu du deuxième conteneur
                  Container(
                    height: 59,
                    width: 350,
                    margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 27, 143, 137),
                        width: 3,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        // Text("Résultat de la ",
                        //     style: TextStyle(
                        //       fontSize: 24,
                        //       fontStyle: FontStyle.normal,
                        //     )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

