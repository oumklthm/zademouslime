
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class requea extends StatefulWidget {
  const requea({Key? key}) : super(key: key);

  @override
  State<requea> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<requea> {
  late CollectionReference<Map<String, dynamic>> _queraneCollection;

  @override
  void initState() {
    super.initState();
    _queraneCollection = FirebaseFirestore.instance.collection('requachareya');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Center(child: Text('الرقية الشرعية',
          style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    
                  ),
        )),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
       stream: _queraneCollection.snapshots(),
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
             
              final String value = document['value'] ?? '';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                   shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                   child: GestureDetector(
                  
                  child: ListTile(
                   title: Align(
                  alignment: Alignment.center,
                    child: Text('$value',
                      style:const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      
                    ),
                    ),
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


