import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class HomeButtonMeeting extends StatelessWidget {
  final VoidCallback onPressed;
  const HomeButtonMeeting({super.key, required this.onPressed});

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
                  )
                ]),
          )
        ],
      ),
    );
  }
}
