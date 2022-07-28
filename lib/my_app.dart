import 'package:app_networking/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking App',
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color(0xffe9c46a),
          cardTheme: const CardTheme(
            color: Color(0xfff4a261),
          ),
          fontFamily: GoogleFonts.manrope().fontFamily),
      home: const HomeView(),
    );
  }
}
