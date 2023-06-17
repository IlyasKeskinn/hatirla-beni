import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatirla_beni/feature/home/home_view.dart';
import 'package:hatirla_beni/feature/login/authentication_provider.dart';
import 'package:hatirla_beni/product/constants/app_string_const.dart';
import 'package:hatirla_beni/product/constants/color_const.dart';
import 'package:hatirla_beni/project_keys/project_keys.dart';
import 'package:kartal/kartal.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final _authenticationProvider =
      StateNotifierProvider<AuthenticationProvider, AuthenticationState>((ref) {
    return AuthenticationProvider();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(_authenticationProvider.notifier).fetchUser(user);
  }

  Future<void> signInAnonymously() async {
    try {
      final user = await FirebaseAuth.instance.signInAnonymously();
      checkUser(FirebaseAuth.instance.currentUser);
      context.navigateToPage(const HomeView());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FirebaseUIActions(
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              if (state.user != null) {
                checkUser(FirebaseAuth.instance.currentUser);
                if (ref.watch(_authenticationProvider).isRedirectHome ??
                    false) {
                  context.navigateToPage(const HomeView());
                }
              }
            })
          ],
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginView(
                  footerBuilder: (context, action) {
                    return ordivider(context);
                  },
                  action: AuthAction.signIn,
                  providers: FirebaseUIAuth.providersFor(
                    FirebaseAuth.instance.app,
                  ),
                ),
                OAuthProviderButton(
                    action: AuthAction.signIn,
                    provider: GoogleProvider(
                        clientId: ProjectKeys.client_id,
                        redirectUri: ProjectKeys.redirect_uri)),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorConst.grey)),
                          onPressed: () {
                            signInAnonymously();
                          },
                          child: const Text(AppStringConst.anonymouslySign)),
                    ),
                  ],
                )
              ],
            ),
          )),
    ));
  }

  Padding ordivider(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
          Text('veya'),
          Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
