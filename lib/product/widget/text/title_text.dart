import 'package:flutter/material.dart';
import 'package:hatirla_beni/product/constants/color_const.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: ColorConst.white,
      ),
    );
  }
}