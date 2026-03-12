import 'package:flutter/material.dart';

import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';


class CustomExploreButton extends StatelessWidget {
    final String text;
  final Function onPressed;
  const CustomExploreButton({super.key,  required this.text,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              
                 onPressed: () {
            onPressed();
          },

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 70),
                backgroundColor:AppColors.red
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    
                    text,
                    style: AppTextStyles.buttonTitleStyle
                  ),
                  Icon((Icons.arrow_forward), color: Colors.white, size: 26),
                ],
              ),
            ),
          );
  }
}