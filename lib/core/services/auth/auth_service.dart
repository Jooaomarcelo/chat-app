import 'dart:io';

import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/services/auth/auth_firebase_service.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup(String name, String email, String password, File? image);

  Future<void> login(String email, String password);

  Future<void> logout();

  // Fazemos isso para retornar uma instancia de uma classe diferente que implementa AuthService
  factory AuthService() {
    // return AuthMockService();
    return AuthFirebaseService();
  }
}
