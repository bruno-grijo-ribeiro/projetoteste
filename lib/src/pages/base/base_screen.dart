import 'package:emergencia190/src/pages/other1/other1_tab.dart';
import 'package:emergencia190/src/pages/other2/other2_tab.dart';
import 'package:flutter/material.dart';
import 'package:emergencia190/src/pages/home/home_tab.dart';
import 'package:emergencia190/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          Other1Tab(),
          Other2Tab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
            // pageController.animateToPage(
            //   index,
            //   duration: const Duration(milliseconds: 500),
            //   curve: Curves.easeInOutQuart,
            // );
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pág. 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pág. 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'perfil',
          ),
        ],
      ),
    );
  }
}
