import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class HomeButtonMeeting extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const HomeButtonMeeting(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            height: 60,
            width: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
