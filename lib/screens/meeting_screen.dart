import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/widgets/home_button_meeting.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "test-room");
  final subjectText = TextEditingController(text: "Test Meeting");
  final tokenText = TextEditingController();
  final userDisplayNameText = TextEditingController(text: "Test User");
  final userEmailText = TextEditingController(text: "test@example.com");

  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButtonMeeting(
              onPressed: () => _createMeeting(),
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeButtonMeeting(
              onPressed: () => _joinMeeting(),
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
              'Create or Join a Meeting with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _createMeeting() async {
    _joinMeeting();
  }

  Future<void> _joinMeeting() async {
    String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomText.text,
      serverUrl: serverUrl,
      subject: subjectText.text,
      token: tokenText.text,
      isAudioMuted: isAudioMuted,
      isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: userDisplayNameText.text,
      userEmail: userEmailText.text,
    );

    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) =>
            debugPrint("onConferenceWillJoin: url: $url"),
        onConferenceJoined: (url) =>
            debugPrint("onConferenceJoined: url: $url"),
        onConferenceTerminated: (url, error) =>
            debugPrint("onConferenceTerminated: url: $url, error: $error"),
        onAudioMutedChanged: (isMuted) =>
            debugPrint("onAudioMutedChanged: isMuted: $isMuted"),
        onVideoMutedChanged: (isMuted) =>
            debugPrint("onVideoMutedChanged: isMuted: $isMuted"),
      ),
    );
  }
}
