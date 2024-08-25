import 'package:flutter/material.dart';
import 'package:zoom/widgets/home_button_meeting.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButtonMeeting(
              onPressed: () {},
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeButtonMeeting(
              onPressed: () {},
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeButtonMeeting(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeButtonMeeting(
              onPressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              'Create or Join Meeting with just a click !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
