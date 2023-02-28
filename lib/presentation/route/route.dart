import 'package:appwrite_example/presentation/pages/auth/login.dart';
import 'package:appwrite_example/presentation/pages/auth/splash.dart';
import 'package:appwrite_example/presentation/pages/home.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return MaterialPageRoute(
        settings: const RouteSettings(name: SplashPage.route),
        builder: (_) => const SplashPage(),
      );
    case 'login':
      return MaterialPageRoute(
        settings: const RouteSettings(name: LoginPage.route),
        builder: (_) => const LoginPage(),
      );
    case 'home':
      return MaterialPageRoute(
        settings: const RouteSettings(name: HomePage.route),
        builder: (_) => const HomePage(),
      );
    default:
      throw ('This route nae does not exist');
  }
}
