import 'package:flutter/material.dart';
import 'package:learn_test/constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.child, this.isLoading = false, this.onPressed, required this.padding });
  final Widget child;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      height: Sizes.p48,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading ? const CircularProgressIndicator() : child),
    );
  }
}
