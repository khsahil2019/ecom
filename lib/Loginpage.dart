import 'dart:developer';

import 'package:ecom/Verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Loginpage extends StatefulWidget {


  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController mobilectrl = new TextEditingController();
bool isLoading=false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green.shade300,
            child: ListView(

              children: [

                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/images/icon0.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Login With Your Mobile Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,fontFamily: 'LibreBaskerville-Bold'
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                !isLoading ? Container(

                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(

                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    child:  TextField(
                      style: TextStyle(color: Colors.orange.shade700,fontSize: 34
                      ),
                     controller: mobilectrl,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                             hintText: "",
                          counterText: "",
                          border: InputBorder.none,
                          prefixIcon: Text("+91",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
                          prefixIconConstraints:
                          BoxConstraints(minHeight: 0, minWidth: 0)),
                    ),

                  ):Center(child: CircularProgressIndicator(),),
                  SizedBox(height: 50),
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
                ])
              ],
            ),
          )
        ],
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
