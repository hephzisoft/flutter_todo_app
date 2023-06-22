import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen/todo_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF139CE3),
          textTheme: TextTheme(
              titleMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
    );
  }
}
