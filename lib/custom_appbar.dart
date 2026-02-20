import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
   CustomAppbar( {super.key, required this.title});
  String title;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/images/Rectangle 4.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(0, 0, 0, 0.6), Colors.transparent],
              ),
            ),
          ),
        ),

        Positioned(
          top: 45,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
            widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 6,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Which planet',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'would you like to explore?',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
