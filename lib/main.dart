import 'package:flutter/material.dart';
import 'package:chat_app/core/services/notification/chat_notification_service.dart';
import 'package:chat_app/pages/auth_or_app_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blueAccent,
            secondary: Colors.deepOrange,
          ),
          useMaterial3: true,
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                centerTitle: true,
              ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: const AuthOrAppPage(),
      ),
    );
  }
}
