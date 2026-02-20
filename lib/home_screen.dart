import 'package:flutter/material.dart';
import 'package:space_app/custom_appbar.dart';
import 'package:space_app/planet_details.dart';
import 'package:space_app/planets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/homeScreen";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
int currentIndex = 0;
void nextPlanet() {
  if (currentIndex < planets.length - 1) {
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

void previousPlanet() {
  if (currentIndex > 0) {
    controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.transparent,
    appBar:  PreferredSize(
        preferredSize: Size.fromHeight(200), 
      
        child: AppBar(
          
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false, 
          flexibleSpace: CustomAppbar( title: "Explore")
        ),
        
      ),
      
    body: Column(
  
  children: [
    Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: planets.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final planet = planets[index];

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


    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    
      
        GestureDetector(
          onTap: previousPlanet,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:Color(0xFFEE403D),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
    
        const SizedBox(width: 20),
    
      
        Text(
          planets[currentIndex].name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
    
        const SizedBox(width: 20),
    
        
        GestureDetector(
          onTap: nextPlanet,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:Color(0xFFEE403D),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    ),
    SizedBox(height: 57,),
    Padding(
  padding: const EdgeInsets.all(12),
  child: ElevatedButton(
    onPressed: () {
      // روح لصفحة التفاصيل مع إرسال بيانات الكوكب الحالي
      Navigator.pushNamed(
        context,
        PlanetDetailScreen.routeName,
        arguments: planets[currentIndex], // بيانات الكوكب الحالي
      );
    },
    
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 70),
      backgroundColor: Color(0xFFEE403D)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore ${planets[currentIndex].name}", // اسم الكوكب الحالي
          style: const TextStyle(fontSize: 22, color: Colors.white,fontFamily: 'SpaceGrotesk'),
        ),
        Icon((Icons.arrow_forward),color: Colors.white,size: 26,)
      ],
    ),
  ),
),
  ],
),
    );
  }
}

//   Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [

//     /// سهم الشمال
//     GestureDetector(
//       onTap: previousPlanet,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.15),
//           shape: BoxShape.circle,
//         ),
//         child: const Icon(
//           Icons.arrow_back_ios_new,
//           color: Colors.white,
//           size: 18,
//         ),
//       ),
//     ),

//     const SizedBox(width: 20),

//     /// اسم الكوكب
//     Text(
//       planet.name,
//       style: const TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//         fontFamily: 'SpaceGrotesk',
//       ),
//     ),

//     const SizedBox(width: 20),

//     /// سهم اليمين
//     GestureDetector(
//       onTap: nextPlanet,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.15),
//           shape: BoxShape.circle,
//         ),
//         child: const Icon(
//           Icons.arrow_forward_ios,
//           color: Colors.white,
//           size: 18,
//         ),
//       ),
//     ),
//   ],
// )
