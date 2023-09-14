import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import './screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(),
          bodyMedium: GoogleFonts.poppins(),
          bodySmall: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
