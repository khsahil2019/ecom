import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';


class picadd extends StatefulWidget {

  const picadd({Key? key}) : super(key: key);

  @override
  _picaddState createState() => _picaddState();
}

class _picaddState extends State<picadd> {
  TextEditingController namectrl = new TextEditingController();
  TextEditingController mrpctrl = new TextEditingController();
  TextEditingController disctrl = new TextEditingController();
  XFile? uploadimage;
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [

                SizedBox(height: 40,),



                GestureDetector(
                  onTap: () {
                    showPicker(context);
                  },
                  child: uploadimage == null
                      ? Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF111D3A),),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                  )
                      : Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(uploadimage!.path.toString())),
                      ),
                    ),
                  ),
                ),

                Container(

                  child: TextField(
                    controller: namectrl,

                    decoration: InputDecoration(
                      label: Text("NAME"),
                      labelStyle: TextStyle(color: Colors.blue),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), //focusedborder
                    ),   //inputdecortion
                  ), //textfield
                ),  //container

         SizedBox(height: 20,),
                Container(

                  child: TextField(
                    controller: mrpctrl,

                    decoration: InputDecoration(
                      label: Text("MRP"),
                      labelStyle: TextStyle(color: Colors.blue),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), //focusedborder
                    ),   //inputdecortion
                  ), //textfield
                ),  //containe

                SizedBox(height: 20,),


                Container(

                  child: TextField(
                    controller: disctrl,

                    decoration: InputDecoration(
                      label:  Text("DISCOUNT"),
                      labelStyle: TextStyle(color: Colors.blue),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), //focusedborder
                    ),   //inputdecortion
                  ), //textfield
                ),  //containe
SizedBox(height: 40,),


                GestureDetector(
                  onTap: (){
                    log("CONTAINER PRESSED");
                  },
                  child: Container(
                    //width: 90,
                    height: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.teal.shade400),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "SAVED",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
















              ],
            ),
          )
        ],
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      chooseImageFromGalary();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    chooseImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }




  Future<void> chooseImageFromGalary() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }

  Future<void> chooseImageFromCamera() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.camera);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }







}
