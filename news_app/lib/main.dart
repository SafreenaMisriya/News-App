import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/screen.dart/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
            create: (context) => NewsBloc( newsRepository: Newsrepository()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColorLight: Colors.white,
            textTheme: GoogleFonts.dmSerifDisplayTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SplashScreen()),
    );
  }
}
