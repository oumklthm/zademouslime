import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edkarymeslime/deae.dart';
import 'package:edkarymeslime/edkar.dart';
import 'package:edkarymeslime/elquerane.dart';
import 'package:edkarymeslime/sebaha.dart';
import 'package:flutter/material.dart';

class FirebaseData {
  final String logoUrl;
  final String Title;

  FirebaseData({required this.logoUrl, required this.Title});
}

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Hompage> {
  List<Widget> itemsData = [];
  String prayerDuaa = "Loading...";
  Future<void> printAllPrayerDuaa() async {
    try {
      // Récupérer tous les documents de la collection "deaee"
      QuerySnapshot deaeeSnapshot =
          await FirebaseFirestore.instance.collection('deaee').get();

      // Parcourir tous les documents et imprimer le champ "prayerDuaa"
      deaeeSnapshot.docs.forEach((doc) {
        String prayerDuaa = doc['prayerDuaa'] ?? "Prayer duaa not found";
        print('Prayer Duaa: $prayerDuaa');
      });
    } catch (error) {
      print("Error printing all prayerDuaa: $error");
    }
  }

  void updatePrayerDuaa() async {
    try {
      // Récupérer tous les documents de la collection "deaee"
      QuerySnapshot deaeeSnapshot =
          await FirebaseFirestore.instance.collection('deaee').get();

      // Vérifier si la collection contient des documents
      if (deaeeSnapshot.docs.isNotEmpty) {
        // Choisir un document au hasard (vous pouvez ajuster cela selon vos besoins)
        final randomIndex = Random().nextInt(deaeeSnapshot.docs.length);
        final randomDoc = deaeeSnapshot.docs[randomIndex];

        // Extraire le champ prayerDuaa du document
        final fetchedPrayerDuaa =
            randomDoc['prayerDuaa'] ?? "Prayer duaa not found";

        // Mettre à jour la variable prayerDuaa avec la valeur récupérée
        setState(() {
          prayerDuaa = fetchedPrayerDuaa;
        });

        // Imprimer le message dans la console
        DateTime now = DateTime.now();
        print('Updated prayerDuaa at $now: $fetchedPrayerDuaa');
      } else {
        // Si la collection est vide, afficher un message approprié
        setState(() {
          prayerDuaa = "Prayer duaa not found";
        });
      }
    } catch (error) {
      // En cas d'erreur, imprimer l'erreur et afficher un message d'erreur
      print("Error updating prayerDuaa: $error");
      setState(() {
        prayerDuaa = "An error occurred while updating prayerDuaa";
      });
    }
  }

  Future<String> fetchPrayerDuaa() async {
    try {
      // Récupérer les données de la collection "deaee" en ordre aléatoire
      QuerySnapshot deaeeSnapshot = await FirebaseFirestore.instance
          .collection('deaee')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      if (deaeeSnapshot.docs.isNotEmpty) {
        var data = deaeeSnapshot.docs[0].data() as Map<String, dynamic>?;

        // Vérifier si le champ prayerDuaa existe et n'est pas nul
        if (data != null &&
            data.containsKey('prayerDuaa') &&
            data['prayerDuaa'] != null) {
          return data['prayerDuaa'];
        } else {
          return "Prayer duaa not found";
        }
      } else {
        return "Prayer duaa not found";
      }
    } catch (error) {
      print("Error fetching prayerDuaa: $error");
      return "An error occurred while fetching prayerDuaa";
    }
  }

  Future<List<FirebaseData>> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Supplications muslmanes')
        .get();

    List<FirebaseData> data = querySnapshot.docs.map((doc) {
      return FirebaseData(
        logoUrl: doc['logoUrl'],
        Title: doc['Title'],
      );
    }).toList();

    return data;
  }

  @override
  void initState() {
    super.initState();
    print('initState called');
    //      Timer.periodic(const Duration(minutes: 1), (timer) {
    //   updatePrayerDuaa();
    // });
    printAllPrayerDuaa();
    fetchData().then((data) {
      print('Data: $data');
      setState(() {
        itemsData = data.map((item) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              margin: EdgeInsets.all(20.0),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.grey[50],
              borderOnForeground: true,
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Image.network(
                      item.logoUrl,
                      width: 60,
                      height: 50,
                      fit: BoxFit.cover,
                    ), // Assuming your logoUrl is a URL
                    const SizedBox(width: 190),
                    Text(
                      item.Title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      });
    });
    // Appelez la fonction pour mettre à jour le duaa de prière toutes les 2 minutes

    Timer.periodic(const Duration(minutes: 1), (timer) {
      updatePrayerDuaa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    margin: EdgeInsets.all(20.0),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.grey[50],
                    borderOnForeground: true,
                    child: SizedBox(
                      height: 150,
                      child: Center(
                        child: Text(
                          prayerDuaa,
                          style: const TextStyle(
                              fontSize: 24,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 180,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => elquerane()),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(right: 25),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                  'assetes/images/mashav.png', // Remplacez par le chemin correct de votre image
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover

                                  // color: Color.fromARGB(255, 20, 125, 160),
                                  ),
                              Center(
                                child: Text(
                                  // TextAlign.Alignment.bottomLeft,
                                  "القرآن \nالكريم",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sebaha()),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 20),
                        height: 100,
                        // height: categoryHeight,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 87, 130, 164),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                  'assetes/images/tesbih2.jpg', // Remplacez par le chemin correct de votre image
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover

                                  // color: Color.fromARGB(255, 20, 125, 160),
                                  ),
                              Center(
                                child: Text(
                                  "السبحة\nالألكترونيه ",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => deae()),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(right: 20),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.shade400,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                  'assetes/images/mashav.png', // Remplacez par le chemin correct de votre image
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover

                                  // color: Color.fromARGB(255, 20, 125, 160),
                                  ),

                              Center(
                                child: Text(
                                  "الدعاء",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(
                              //   "20 Items",
                              //   style: TextStyle(fontSize: 16, color: Colors.white),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "قائمة الأذكار",
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.left,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Edkar(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: itemsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemsData[index];
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
