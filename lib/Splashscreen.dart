import 'package:ecom/Loginpage.dart';
import 'package:ecom/signinpage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

    });
 }
  @override
  

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      //backgroundColor: Image.asset("assets/images/icon1.png").color.,

      body: Container(
          decoration: BoxDecoration(
           color: Colors.green.shade300,
              // image: DecorationImage(
              //     image: AssetImage("assets/images/background1.jpg"),
              //     fit: BoxFit.cover
              // )
          ),

        //color: Colors.white,
         child: Center(
           child: Image.asset("assets/images/icon0.png",
              width: 250,
              height: 250,),
         )
      )
    );
  }
}

