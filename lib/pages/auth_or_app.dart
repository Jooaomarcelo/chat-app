import 'package:chat_app/core/services/auth/auth_service.dart';
import 'package:chat_app/pages/auth_page.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrApp extends StatelessWidget {
  const AuthOrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: AuthService().userChanges,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          return snapshot.hasData ? ChatPage() : AuthPage();
        }
      },
    ));
  }
}
