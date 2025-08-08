import 'package:flutter/material.dart';
import 'package:meme_app/screens/meme_home_page.dart';

void main() {
  runApp(MemeApp());
}

class MemeApp extends StatelessWidget {
  const MemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

debugShowCheckedModeBanner: false,
theme: ThemeData(

primaryColor: const Color.fromARGB(255, 165, 250, 243),
visualDensity: VisualDensity.adaptivePlatformDensity

),
home: MemeHomePage() ,
    );
  }
}