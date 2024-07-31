import 'package:flutter/material.dart';

class InstaHomePageStoryWidget extends StatelessWidget {
  final String userProfile;
  final String userName;
  const InstaHomePageStoryWidget(
      {super.key, required this.userProfile, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(90),
            border: Border.all(
              color: Colors.blue,
              width: 4,
            ),
            image: DecorationImage(
                image: AssetImage(userProfile), fit: BoxFit.cover)),
      ),
      Text(
        userName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }
}
