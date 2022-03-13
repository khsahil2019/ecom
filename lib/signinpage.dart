import 'dart:developer';

import 'package:ecom/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Loginpage.dart';
import 'category.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController useridctrl = new TextEditingController();
  TextEditingController passctrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Log In",
              style: GoogleFonts.praise(

                //textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 58,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Container(

              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
             // padding: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: useridctrl,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefix: Text(""),
                    prefixIcon: Icon(Icons.verified_user,color: Colors.black,),
                    hintText: " User Id",
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(

              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    obscureText: true,
                  cursorColor: Colors.white,
                  controller: passctrl,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefix: Text(""),
                    prefixIcon: Icon(Icons.verified_user,color: Colors.black,),
                    hintText: " Password",
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  log("Circle avtar Tapped");

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                },
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 40,
                  width: 200,
                  child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  width: width * .40,
                  height: 2,
                  color: Colors.grey,
                ),
                Text(" OR "),
                Container(
                  width: width * .40,
                  height: 2,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text("Don't Have Account ? ",
                    style: TextStyle(
                      fontSize: 17,
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                  },
                  child: Text(
                    " sign up",
                    style: GoogleFonts.poppins(
                      //textStyle: Theme.of(context).textTheme.headline4,

                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Text(" Here",
                    style: TextStyle(
                      fontSize: 17,
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
