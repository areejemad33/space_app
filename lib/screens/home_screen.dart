import 'package:flutter/material.dart';
import 'package:space_app/core/models/planet_model.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';
import 'package:space_app/core/widgets/custom_explore_button.dart';
import 'package:space_app/core/widgets/custom_moon_header.dart';
import 'package:space_app/screens/planet_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.black,

      body: Column(
        children: [
          const CustomMoonHeader(
            title: 'Explore',
            subTitle: 'Which planet\nwould you like to explore?',
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: Planet.planets.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final planet = Planet.planets[index];

                return Center(
                  child: Image.asset(
                    planet.image,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    iconSize: 28,
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  Planet.planets[currentPage].name,
                  style: AppTextStyles.bodyMeduim,
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: const CircleBorder(),
                    iconSize: 28,
                  ),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
         CustomExploreButton(
            text: 'Explore ${Planet.planets[currentPage].name}',
            onPressed: () {
              Navigator.pushNamed(
                context,
            PlanetDetailScreen.routeName,
                arguments: Planet.planets[currentPage],
              );
            },
          ),
        ],
      ),
    );
  }
}
