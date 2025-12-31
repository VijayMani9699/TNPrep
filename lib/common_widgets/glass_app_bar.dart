import 'dart:ui';
import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double height;
  final double blurSigma;
  final Color backgroundColor;

  const GlassAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.height = kToolbarHeight,
    this.blurSigma = 10.0,
    this.backgroundColor =
        const Color(0xB3FFFFFF), // Colors.white.withOpacity(0.7)
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: AppBar(
          title: title,
          centerTitle: centerTitle,
          leading: leading,
          actions: actions,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black87),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bottomOpacity: 0.0,
          scrolledUnderElevation: 0,
        ),
      ),
    );
  }
}
