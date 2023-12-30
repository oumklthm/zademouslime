
// import 'package:flutter/widgets.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'dart:async';

import 'package:edkarymeslime/hompage.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3600), () {
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hompage()),
                  );
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     whitecolor,
          //     whitecolor,
          //   ],
          //   stops: [0.5, 1],
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: const Image(
                  width: 300,
                  height: 200,
                  image: AssetImage("assetes/images/logo2.png"),
                  fit: BoxFit.none,
                ),
              ),
                 const Text(
                " الأذكارى",
                  style: TextStyle(fontSize: 30,  fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, ),
                   textAlign: TextAlign.left,
                   
                ),
            ],
          ),
        ),
      ),
    );
  }
}
