// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatirla_beni/enums/cache_items.dart';
import 'package:hatirla_beni/product/utility/firebase/firebase_collections.dart';

class AuthenticationProvider extends StateNotifier<AuthenticationState> {
  AuthenticationProvider() : super(const AuthenticationState());

  Future<void> fetchUser(User? user) async {
    if (user == null) {
      print('null');
      return;
    }
    final token = await user.getIdToken();
    saveUserCache(token);
    await saveUserFirebase(user);
    state = state.copyWith(isRedirectHome: true);
  }

  void saveUserCache(userToken) {
    CacheItems.token.write(userToken);
  }

  Future<void> saveUserFirebase(User? user) async {
    final snapshot =
        await FirebaseCollection.users.reference.doc(user!.uid).get();

    if (!snapshot.exists) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email,
        'name': user.displayName ?? 'User',
        'userId': user.uid
      });
    }
  }
}

class AuthenticationState extends Equatable {
  const AuthenticationState({this.isRedirectHome});
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRedirectHome];

  AuthenticationState copyWith({
    bool? isRedirectHome,
  }) {
    return AuthenticationState(
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
