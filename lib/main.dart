import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatirla_beni/feature/splash/splash_screen_view.dart';
import 'package:hatirla_beni/product/initialize/app_start_init.dart';
import 'package:hatirla_beni/product/initialize/app_theme.dart';
import 'package:hatirla_beni/product/lang/label_overrides.dart';

void main() async {
  await AppStartInitialize.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
        FirebaseUILocalizations.delegate,
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      home: const SplashScreenView(),
    );
  }
}
