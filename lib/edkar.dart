import 'package:flutter/material.dart';

class Edkar extends StatefulWidget {
  const Edkar({Key? key}) : super(key: key);

  @override
  State<Edkar> createState() => _MyWidgetState();
}

class Item {
  final String Title; // Assurez-vous que le nom est correct
  const Item({required this.Title});
}

class _MyWidgetState extends State<Edkar> {
  List<String> extractArray(String title) {
    List<String> titleParts = title.split("|");

    if (titleParts.length == 2) {
      String count = titleParts[0].trim();
      String contenu = titleParts[1].trim();

      return [count, contenu];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    // Exemple de données pour illustrer la structure de itemsData
    List<Item> itemsData = [
      Item(Title: "2 | Contenu 1"),
      Item(Title: "5 | Contenu 2"),
      // ... Ajoutez d'autres éléments ici
    ];

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
                  SizedBox(height: 5),
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
                    child: InkWell(
                      onTap: () {
                        // Utilisez la fonction extractArray pour obtenir le contenu et le count.
                        List<String> array = extractArray(itemsData[0].Title); // Assurez-vous d'accéder au bon élément
                        // Imprimez les données extraites dans la console.
                        print("Count: ${array[0]}, Contenu: ${array[1]}");
                      },
                      child: const Column(
                        children: [
                          // Ajoutez vos widgets ici.
                        ],
                      ),
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
