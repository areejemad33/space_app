import 'package:flutter/material.dart';
import 'package:space_app/home_screen.dart';

class ZeroScreen extends StatelessWidget {
  const ZeroScreen({super.key});
  static const routeName = "/zeroScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E0E),
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
                children: const [
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "The",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Universe",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEE403D),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Explore",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// O3D.asset(
//           src: "assets/3dmodels/earth.glb",
//           controller: controller,
//           autoRotate: true,
//           backgroundColor: Color(0xFF0E0E0E),
//         ),
  // O3DController controller = O3DController();