import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Havadurumu/homePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) =>  MyHomePage(),
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(
              opacity: anim,
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 67, 82),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 50, 67, 82),
          child: Lottie.asset(
            'assets/logo/weatherkarsilama.json',
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Weather App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xff081b25),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const WelcomePage(),
      '/home': (context) =>  MyHomePage(),
    },
  ));
}
