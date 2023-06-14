import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatirla_beni/enums/image_const.dart';
import 'package:hatirla_beni/feature/login/auth_page.dart';
import 'package:hatirla_beni/product/constants/app_string_const.dart';
import 'package:hatirla_beni/product/constants/color_const.dart';
import 'package:hatirla_beni/product/widget/text/title_text.dart';
import 'package:kartal/kartal.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringConst.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _ProfileBio(),
              context.emptySizedHeightBoxNormal,
              const _SettingsColumn(),
              context.emptySizedHeightBoxLow3x,
              const _LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileBio extends StatelessWidget {
  const _ProfileBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'profile-photo',
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ImageConst.avatar.toPath,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
        context.emptySizedHeightBoxLow,
        TitleText(
            value: FirebaseAuth.instance.currentUser!.displayName.toString()),
      ],
    );
  }
}

class _SettingsColumn extends StatelessWidget {
  const _SettingsColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _settingsTile(
          func: () {},
          leadingIcon: const Icon(Icons.person_outline),
          settingsName: AppStringConst.profileSettings.toCapitalized(),
        ),
        context.emptySizedHeightBoxLow3x,
        _settingsTile(
            func: () {},
            leadingIcon: const Icon(Icons.add_outlined),
            settingsName: AppStringConst.profileAddNewUser.toCapitalized()),
        context.emptySizedHeightBoxLow3x,
        _settingsTile(
            func: () {},
            leadingIcon: const Icon(Icons.switch_account_outlined),
            settingsName: AppStringConst.profileSwitchUser.toCapitalized()),
        context.emptySizedHeightBoxLow3x,
        _settingsTile(
            func: () {},
            leadingIcon: const Icon(Icons.star_border_outlined),
            settingsName: AppStringConst.profileRateApp.toCapitalized()),
        context.emptySizedHeightBoxLow3x,
        _settingsTile(
            func: () {},
            leadingIcon: const Icon(Icons.privacy_tip_outlined),
            settingsName: AppStringConst.profilePrivacy.toCapitalized()),
        context.emptySizedHeightBoxLow3x,
        _settingsTile(
            func: () {},
            leadingIcon: const Icon(Icons.flash_on_outlined),
            settingsName: AppStringConst.profileFeedback.toCapitalized())
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();
      await context.navigateToPage(const AuthPage());
    }

    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: ColorConst.red,
      ),
      onPressed: logOut,
      icon: const Icon(Icons.logout_outlined),
      label: const Text(AppStringConst.logout),
    );
  }
}

class _settingsTile extends StatelessWidget {
  const _settingsTile({
    required this.func,
    required this.leadingIcon,
    required this.settingsName,
    Key? key,
  }) : super(key: key);
  final Widget leadingIcon;
  final String settingsName;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ColorConst.white,
      leading: leadingIcon,
      title: Text(settingsName),
      trailing: IconButton(
          onPressed: func, icon: const Icon(Icons.chevron_right_outlined)),
    );
  }
}
