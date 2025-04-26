import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                onTap: () {
                  mainscreenNotifier.pageIndex = 0;
                },
                icon: mainscreenNotifier.pageIndex == 0
                    ? Icons.home
                    : Icons.home_outlined,
              ),
              BottomNavWidget(
                onTap: () {
                  mainscreenNotifier.pageIndex = 1;
                },
                icon: mainscreenNotifier.pageIndex == 1
                    ? Icons.search
                    : Icons.search,
              ),
              BottomNavWidget(
                onTap: () {
                  mainscreenNotifier.pageIndex = 2;
                },
                icon: mainscreenNotifier.pageIndex == 2
                    ? Icons.add
                    : Icons.add_circle_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainscreenNotifier.pageIndex = 3;
                },
                icon: mainscreenNotifier.pageIndex == 3
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
              ),
              BottomNavWidget(
                onTap: () {
                  mainscreenNotifier.pageIndex = 4;
                },
                icon: mainscreenNotifier.pageIndex == 4
                    ? Icons.person
                    : Icons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
