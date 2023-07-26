import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return NavigationBar(
        backgroundColor: colors.background,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 0,
        selectedIndex: currentIndex,
        onDestinationSelected: (value) => onItemTapped(context, value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_max), label: 'Inicio'),
          NavigationDestination(
              icon: Icon(Icons.thumbs_up_down_outlined), label: 'Populares'),
          NavigationDestination(
              icon: Icon(Icons.favorite_outline), label: 'Favoritos')
        ]);
  }
}
