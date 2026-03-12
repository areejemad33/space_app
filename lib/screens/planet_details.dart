import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:space_app/core/models/planet_model.dart';
import 'package:space_app/core/utils/app_text_styles.dart';
import 'package:space_app/core/widgets/custom_moon_header.dart';

class PlanetDetailScreen extends StatefulWidget {
  static const routeName = "/planetDetail";

  const PlanetDetailScreen({super.key});

  @override
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  late Planet planet;
  @override
  void didChangeDependencies() {
    planet = ModalRoute.of(context)!.settings.arguments as Planet;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    O3DController controller = O3DController();

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomMoonHeader(
              title: planet.name,
              subTitle: planet.title,
              isDetailsScreen: true,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: O3D.asset(
                src: planet.model,
                controller: controller,
                autoRotate: true,
                backgroundColor: const Color(0xFF0E0E0E),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About", style: AppTextStyles.bodyMeduim),
                  const SizedBox(height: 8),
                  Text(planet.about, style: AppTextStyles.bodySmall),
                  const SizedBox(height: 16),
                  Text(
                    "Distance from Sun: ${planet.distanceFromSun} km",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Length of Day: ${planet.lengthOfDay} hours",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Orbital Period: ${planet.orbitalPeriod} years",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Radius: ${planet.radius} km",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Mass: ${planet.mass}",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Gravity: ${planet.gravity} m/s²",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Surface Area: ${planet.surfaceArea} km²",
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: .bold),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
