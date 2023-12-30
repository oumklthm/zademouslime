import 'package:edkarymeslime/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class elquerane extends StatefulWidget {
  const elquerane({Key? key}) : super(key: key);

  @override
  State<elquerane> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<elquerane> {
  late CollectionReference<Map<String, dynamic>> _queraneCollection;

  @override
  void initState() {
    super.initState();
    _queraneCollection = FirebaseFirestore.instance.collection('querane');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Center(child: Text('بسم الله رحم رحيم',
          style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    
                  ),
        )),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
       stream: _queraneCollection.orderBy('idsoura').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // Les données sont prêtes, vous pouvez les utiliser
          final List<DocumentSnapshot<Map<String, dynamic>>> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index].data()!;
              final String ayate = document['ayate'] ?? '';
              final int idsoura = document['idsoura'] ?? 0;
              final String ismsoura = document['ismsoura'] ?? '';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                   shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                   child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            document: document,
                          ),
                        ),
                      );
                    },
                  child: ListTile(
                   title: Align(
                  alignment: Alignment.topRight,
                    child: Text(' $ismsoura $idsoura',
                      style:const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      
                    ),
                    ),
                  ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('$ayate',
                          style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      
                    ),
                        ),
                        // Text(': $idsoura'),
                      ],
                    ),
                  
                  ),
                ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


