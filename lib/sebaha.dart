import 'package:flutter/material.dart';

class sebaha extends StatefulWidget {
  @override
  _sebahaSate createState() => _sebahaSate();
}

class _sebahaSate extends State<sebaha> {
  int _counter = 0;

  void _IncrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _ReserCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 86, 47, 8),
          title: const Text(
            'السبحةالألكترونيه',
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.w200, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assetes/images/tesbih3.webp"),
                fit: BoxFit.fill),
          ),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const Text(
                  'عدد التسبيح',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () {
                    _ReserCounter();
                  },
                  label:const Text(
                    'تصفير',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: const Icon(Icons.settings_backup_restore),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.1, 0.7),
              child: FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  _IncrementCounter();
                },
                label: Text(
                  'تسبيح',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.fingerprint),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {},
                label: Text(
                  'ذكر',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.book),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
