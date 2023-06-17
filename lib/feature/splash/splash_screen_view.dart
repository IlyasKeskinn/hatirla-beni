import 'package:flutter/material.dart';
import 'package:hatirla_beni/enums/image_const.dart';
import 'package:hatirla_beni/feature/login/auth_page.dart';
import 'package:hatirla_beni/product/constants/app_string_const.dart';
import 'package:hatirla_beni/product/constants/color_const.dart';
import 'package:kartal/kartal.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _showErrorSnackBar(context);
    } else {
      _navigatePage(context, const AuthPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConst.appLogo.toPath,
              height: 120,
              width: 120,
            ),
            appName(context),
          ],
        ),
      ),
    );
  }
}

Padding appName(BuildContext context) {
  return Padding(
    padding: context.onlyTopPaddingMedium,
    child: Text(
      AppStringConst.appName,
      style: context.textTheme.displaySmall?.copyWith(
        color: ColorConst.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

void _navigatePage(BuildContext context, Widget page) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  });
}

void _showErrorSnackBar(BuildContext context) {
  var snackBar = SnackBar(
    content: const Text(
      AppStringConst.networkError,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    ),
    backgroundColor: ColorConst.red,
    duration: const Duration(seconds: 10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
