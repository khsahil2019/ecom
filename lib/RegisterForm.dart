import 'dart:developer';
import 'dart:io';
import 'package:ecom/category.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}
enum AppState {
  free,
  picked,
  cropped,
}
class _RegisterFormState extends State<RegisterForm> {
  XFile ?uploadimage;
  late AppState state;
  ImagePicker picker = ImagePicker();
  TextEditingController shopCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController gstCtrl = TextEditingController();
  TextEditingController geoCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController addCtrl = TextEditingController();
  TextEditingController landmarkCtrl = TextEditingController();
  TextEditingController contactCtrl = TextEditingController();
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [





                SizedBox(height: 20,),

                GestureDetector(
                  onTap: () {
                    showPicker(context);
                  },
                  child: uploadimage == null
                      ? Container(

                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF111D3A),),
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 80,
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
                SizedBox(height: 10,),
                Center(child: Text("UPLOAD OWNER IMAGE",style: TextStyle(fontSize: 18),)),
                SizedBox(height: 10,),
               
                
                
               
               
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(shopCtrl, "Shop Name",""),
                ),
                
                
                
                
                
                
                
                
                
                
                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(ownerCtrl, "Owner Name" ,""),
                ),
                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(gstCtrl, "GST No." ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(cityCtrl, "City" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(stateCtrl, "State" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(addCtrl, "Addrerss" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(landmarkCtrl, "Landmark" ,""),
                ),
                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: TextField(

                    controller: geoCtrl,
                    decoration: InputDecoration(
icon: Icon(Icons.gps_fixed),
                      label: Text("Geo-Location",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                      labelStyle: TextStyle(color: Colors.black,),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(stateCtrl, "State",""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(contactCtrl, "Contact No" ,""),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){
                    log("CONTAINER PRESSED");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));

                  },
                  child: Container(
                    //width: 90,
                    height: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black,width: 2,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                  SizedBox(height: 100,),









              ],
            ),
          )
        ],
      ),

    );
  }
  TextField BuildTextField(TextEditingController controller, String label ,String pre) {
    return TextField(
      
      controller: controller,
      decoration: InputDecoration(

        label: Text("$label",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

 Border buildBottomBorder(var color) {
   return Border(
     bottom: BorderSide(
       color: color,
       width: 1,
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





  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: uploadimage!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      uploadimage = croppedFile as XFile?;
      setState(() {
        state = AppState.cropped;
      });
    }
  }
  void _clearImage() {
    uploadimage = null;
    setState(() {
      state = AppState.free;
    });
  }
}
