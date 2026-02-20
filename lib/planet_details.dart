
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:space_app/planet_model.dart';

class PlanetDetailScreen extends StatelessWidget {
  static const routeName = "/planetDetail";

  const PlanetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    O3DController controller = O3DController();

    final Planet planet =
        ModalRoute.of(context)!.settings.arguments as Planet;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: CustomScrollView(
        slivers: [
        
          SliverAppBar(
            
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            pinned: false,
            backgroundColor: const Color(0xFF0E0E0E),
            flexibleSpace: FlexibleSpaceBar(
              
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/Rectangle 4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color.fromRGBO(0, 0, 0, 0.6), Colors.transparent],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        planet.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 85,
                    left: 15,
                    child: Text(
                      planet.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEE403D),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    planet.about,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("Distance from Sun: ${planet.distanceFromSun} km",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Length of Day: ${planet.lengthOfDay} hours",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Orbital Period: ${planet.orbitalPeriod} years",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Radius: ${planet.radius} km",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Mass: ${planet.mass}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Gravity: ${planet.gravity} m/s²",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
                  const SizedBox(height: 8),
                  Text("Surface Area: ${planet.surfaceArea} km²",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk')),
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