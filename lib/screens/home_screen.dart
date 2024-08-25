import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widgets/home_button_meeting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            children: [HomeButtonMeeting(onPressed: () {})],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.comment_bank,
                ),
                label: 'Meet & Char'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_clock,
                ),
                label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Settings'),
          ]),
    );
  }
}
