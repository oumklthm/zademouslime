import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edkarymeslime/deae.dart';
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
    fetchData().then((data) {
      print('Data: $data');
      setState(() {
        itemsData = data.map((item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 3.0,
                  ),
                ],
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 34, 140, 144),
                ),
              ),
              child: Row(
                children: [
                  Image.network(item.logoUrl,
                      width: 50, height: 50), // Assuming your logoUrl is a URL
                  SizedBox(width: 10),
                  Text(
                    item.Title,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      });
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
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    // width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15.0),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(248, 255, 255, 255),
                          blurRadius: 3.0,
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 7, 121, 111),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Prière",
                        style: TextStyle(fontSize: 20),
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
                        margin: EdgeInsets.only(right: 20),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //  Icon(Icons.search, color: Colors.black),
                              Icon(
                                Icons.book_sharp,
                                size: 15,
                                color: Color.fromARGB(255, 20, 125, 160),
                              ),
                              Text(
                                "القرآن \nالكريم",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(
                              //   "20 Items",
                              //   style: TextStyle(fontSize: 10, color: Colors.white),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const sebaha()),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(right: 20),
                        height: 100,
                        // height: categoryHeight,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "السبحة\nالألكترونيه ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "33",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
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
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "الدعاء",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 26),
                ),

                // SizedBox(
                //   height: 400,
                //   child: ListView.builder(
                //     itemCount: 4,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 60,

                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20.0),
                //             boxShadow:  [
                //               BoxShadow(
                //                color: Color.fromARGB(255, 255, 255, 255),
                //                 blurRadius: 3.0,
                //               ),
                //             ],
                //             border: Border.all(
                //               width: 1,
                //                color: Color.fromARGB(255, 34, 140, 144),
                //             ),
                //           ),
                //           // child: const Center(
                //           //   child: Text(
                //           //     "Prière",
                //           //     style: TextStyle(fontSize: 20),
                //           //   ),
                //           // ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: itemsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return itemsData[index];
                    },
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
