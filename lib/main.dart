import 'package:chat_app/pages/loading_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue[700],
          secondary: Colors.deepOrange,
        ),
        useMaterial3: true,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: Colors.blue[900],
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const LoadingPage(),
    );
  }
}
