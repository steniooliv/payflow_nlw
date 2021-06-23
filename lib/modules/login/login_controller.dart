import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow_nlw/shared/auth/auth_controller.dart';
import 'package:payflow_nlw/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSingIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
