

import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: const AssetImage(
                'assets/images/no_internet_pic.jpeg'),
            height: height*0.28,
              width: width*0.6,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(height: height*0.02,),
            Text('No Internet Connection',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black54
            ),),
            SizedBox(height: height*0.1,),
            Material(
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: height*0.041,
                  width: width*0.4,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                  ),
                  child: Center(
                      child:  Text('Try Again',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black87.withOpacity(0.75)
                      ),),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

