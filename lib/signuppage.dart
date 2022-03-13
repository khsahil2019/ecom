import 'dart:developer';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:ecom/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Verify.dart';
import 'devicedetial.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}


/*************** I AM HERE ****************/
void LoginPage() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp(){}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:  GetTokenPage(),
    );
  }
}
/*************** End Here ******************/



class _SignupPageState extends State<SignupPage> {
  
  TextEditingController useridctrl = new TextEditingController();
  TextEditingController namectrl = new TextEditingController();
  TextEditingController psswrdctrl = new TextEditingController();
  TextEditingController psswrdctrl2 = new TextEditingController();
  TextEditingController emailctrl = new TextEditingController();
  TextEditingController mobilectrl = new TextEditingController();
  bool isLoading=false;








  @override




  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child :Column(
            children: <Widget>[
              SizedBox(height: 30,),

      Image.asset("assets/images/icon0.png"),
              SizedBox(height: 20,),

              Container(

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8),
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



              SizedBox(height: 10,),
              Container(

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: namectrl,
                    decoration: InputDecoration(

                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefix: Text(""),
                      prefixIcon: Icon(Icons.person,color: Colors.black,),
                      hintText: " Name",
                      hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Container(

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: emailctrl,
                    decoration: InputDecoration(

                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefix: Text(""),
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      hintText: " E-mail",
                      hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Container(

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: psswrdctrl,
                    decoration: InputDecoration(

                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefix: Text(""),
                      prefixIcon: Icon(Icons.password,color: Colors.black,),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: psswrdctrl2,
                    decoration: InputDecoration(

                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefix: Text(""),
                      prefixIcon: Icon(Icons.password,color: Colors.black,),
                      hintText: " Confirm Password",
                      hintStyle: TextStyle(color: Colors.black,fontSize: 15),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),


             /***** HERE ******/



              Column(children: [
                SizedBox(
                  height: 0,
                ),
                !isLoading ?  Container(
                  padding: EdgeInsets.only(left: 10),

                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: TextField(
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    cursorColor: Colors.white,
                    controller: mobilectrl,
                    decoration: const InputDecoration(

                        hintText: "    XXXXXXXXXX",
                        counterText: "",
                        border: InputBorder.none,

                       // prefixIcon: Text("  +91 ",style: TextStyle(fontSize: 25),),
                        prefixIcon: Icon(Icons.phone,color: Colors.black,),

                        prefixIconConstraints:
                        BoxConstraints(minHeight: 0, minWidth: 0)

                    ),
                  ),
                )
                :Center(child: CircularProgressIndicator(),),
                SizedBox(height: 20),
                //ElevatedButton(onPressed: () {}, child: Text("CONTINUE")),
                !isLoading? GestureDetector(
                  onTap: () {
                    if(isValidate()){
                      setState(() {
                        isLoading=!isLoading;
                      });
                      log("Container was tapped");
                      signin();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ):SizedBox()
              ]),


SizedBox(height: 20,),
/*************** TILL HERE ************************/
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
                      " SIGN UP",
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






            ],
          ),//column
        ),
      ),
    );
  }




  void signin() {
    log("run");
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: "+91" + mobilectrl.text,
        verificationCompleted: (cred) {
          setState(() {
            isLoading=!isLoading;
          });
          log("complete");
        },
        verificationFailed: (e) {
          print("error bfound"+e.toString());
          showToast(e.message);
          setState(() {
            isLoading=!isLoading;
          });
        },
        codeSent: (String Verifyid, token) {
          setState(() {
            isLoading=false;
          });
          log("sent OTP");
          showToast("OTP sent to ${mobilectrl.text}");
          Navigator.push(context,MaterialPageRoute(builder: (context) => Verify(Verifyid)));
        },
        codeAutoRetrievalTimeout: (_) {});
  }
  bool isValidate(){
    if(mobilectrl.text.isEmpty){
      print("Mobile can not nbe empty.");
      showToast("Mobile can not nbe empty.");
      return false;
    }
    else if(mobilectrl.text.length<10){
      showToast("Mobile can not be less than 10 digt.");
      print("Mobile can not be less than 10 digt.");
      return false;
    }
    return true;
  }
  showToast(msg){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        //  gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange.shade700,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }







}
