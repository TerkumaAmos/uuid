import 'package:flutter/material.dart';
import 'package:hate/controllers/mainscreen_provider.dart'
    show MainscreenNotifier, MainscreenProviders;
import 'package:hate/views/ui/cart_page.dart';
import 'package:hate/views/ui/home_page.dart';
import 'package:hate/views/ui/profile_page.dart';
import 'package:hate/views/ui/search_page.dart';
import 'package:provider/provider.dart';

import '../shared/bottom_nav_widget.dart' show BottomNavWidget;

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenNotifier>(builder: (
      context,
      mainscreenNotifier,
      child,
    ) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainscreenNotifier.pageIndex],
        bottomNavigationBar: BottomNav(),
      );
    });
  }
}
