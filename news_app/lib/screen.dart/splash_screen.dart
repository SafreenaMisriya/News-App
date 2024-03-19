import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen.dart/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'N E W S H U N T',
              style: GoogleFonts.almarai(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color:Colors.red
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset('asset/images/anime.gif'),
          ],
        ),
      ),
    );
  }
}
