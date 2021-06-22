import 'package:flutter/material.dart';
import 'package:payflow_nlw/modules/home/home_page.dart';
import 'package:payflow_nlw/modules/login/login_page.dart';
import 'package:payflow_nlw/modules/splash/splash_page.dart';
import 'package:payflow_nlw/shared/themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: LoginPage(),
    );
  }
}
