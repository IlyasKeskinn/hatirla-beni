import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatirla_beni/enums/image_const.dart';
import 'package:hatirla_beni/feature/profile/profile._view.dart';
import 'package:hatirla_beni/product/constants/app_string_const.dart';
import 'package:hatirla_beni/product/widget/text/title_text.dart';
import 'package:kartal/kartal.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TitleText(value: AppStringConst.appName),
          actions: [
            InkWell(
              onTap: () {
                context.navigateToPage(const ProfileView(),
                    type: SlideType.BOTTOM);
              },
              child: const _profile_avatar(),
            )
          ]),
    );
  }
}

class _profile_avatar extends StatelessWidget {
  const _profile_avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyRightPaddingNormal,
      child: Hero(
        tag: 'profile-photo',
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ImageConst.avatar.toPath,
                width: 50,
                height: 50,
              )),
        ),
      ),
    );
  }
}
