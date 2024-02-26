import 'package:covid19_tracker/World_Tracking.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> with SingleTickerProviderStateMixin {

  late final AnimationController controller=AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WorldTracking(),));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            AnimatedBuilder(
              animation: controller,
              child:  const Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/images/virus.png')),
              builder: (context, child) {
                return Transform.rotate(
                  transformHitTests: false,
                  // alignment: Alignment.topCenter,
                  angle: controller.value*2*math.pi,
                  child: child,
                );
              },),
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            Text('Covid-19',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink.shade200),),
            Text('Tracker App',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink.shade200),)
          ],
        ),
      ),
    );
  }
}