import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumyum_flutter/calculate-triangle.screen.dart';
import 'package:yumyum_flutter/contact.screen.dart';
import 'package:yumyum_flutter/profile.screen.dart';
import './bottom_menu.provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const routeName = '/bottom-nav-bar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _selectedScreen = 0;
  int _selectedScreenChanged = 0;
  bool _selectedScreenCheck = true;

  final List<BottomNavigationBarItem> _listTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.contact_phone_outlined),
      label: 'รายชื่อ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calculate_outlined),
      label: 'คำนวณพื้นที่สามเหลี่ยม',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'โปรไฟล์',
    ),
  ];

  List<Widget> _listScreens() {
    return <Widget>[
      const ContactScreen(),
      const CalculateTriangleScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottomMenu = Provider.of<BottomMenuProvider>(context, listen: true);
    onTabTapped(bottomMenu.getIndexNumber(), bottomMenu);

    if (_selectedScreen == _selectedScreenChanged) {
      setState(() {
        _selectedScreenCheck = true;
      });
    }

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            onPageChanged: (index) => setState(() {
                  if (_selectedScreenCheck == true) {
                    onTabTapped(index, bottomMenu);
                  }
                  _selectedScreenChanged = index;
                }),
            // physics: const AlwaysScrollableScrollPhysics(),
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _listScreens()),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreen,
          type: BottomNavigationBarType.fixed,
          items: _listTabs,
          onTap: (index) => setState(() {
                _selectedScreenCheck = false;
                onTabTapped(index, bottomMenu);
              })),
    );
  }

  void onTabTapped(int index, bottomMenu) {
    setState(() {
      _selectedScreen = index;
      try {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      } catch (ex) {}
      bottomMenu.setIndexNumber(index);
    });
  }
}
