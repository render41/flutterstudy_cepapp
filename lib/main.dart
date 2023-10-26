import 'package:flutter/material.dart';
import 'package:flutterstudy_cepapp/features/cep/presentation/page/cep_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const CepPage(),
    );
  }
}
