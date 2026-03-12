import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';
import 'package:space_app/core/widgets/custom_explore_button.dart';
import 'package:space_app/screens/home_screen.dart';

class ZeroScreen extends StatelessWidget {
  const ZeroScreen({super.key});
  static const routeName = "/zeroScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/home.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore\nThe\nUniverse',
                    style: AppTextStyles.headLine,
                  ),
                  
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 2,
            right: 2,
            child:  CustomExploreButton(
              text: 'Explore',
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

