import 'package:ecom/RegisterForm.dart';
import 'package:ecom/Verify.dart';
import 'package:ecom/category.dart';
import 'package:ecom/picadd.dart';
import 'package:ecom/signinpage.dart';
import 'package:ecom/signuppage.dart';
import 'package:ecom/uploadpic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Splashscreen.dart';
import 'deviceinfotwo.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DeviceDetailDemo(),
  ),);
}


