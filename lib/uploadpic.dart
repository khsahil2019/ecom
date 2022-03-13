import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';




class UploadPic extends StatefulWidget {
  UploadPic(){ }



  @override
  State<UploadPic> createState() => _UploadPicState();
}
class _UploadPicState extends State<UploadPic> {

  TextEditingController username = new TextEditingController();
  TextEditingController qualification = new TextEditingController();
  TextEditingController specialization = new TextEditingController();
  TextEditingController contact = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController fees = new TextEditingController();
  TextEditingController time = new TextEditingController();
  // TextEditingController qualification= new TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? uploadimage;
  String _selectedGender = 'male';
  bool isLoading = false;


  /// ******* CODE FOR UPLOAD IN DATABASE START **********/
  Future<void> uploadDoctorInfo() async {
    // ignore: unrelated_type_equality_checks
    if ( username.text.isNotEmpty &&
        qualification.text.isNotEmpty &&
        specialization.text.isNotEmpty &&
        contact.text.isNotEmpty &&
        address.text.isNotEmpty &&
        location.text.isNotEmpty &&
        fees.text.isNotEmpty &&
        time.text.isNotEmpty &&
        _selectedGender.isNotEmpty &&
        uploadimage != null) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://echogarden.000webhostapp.com/upload_details.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path));

      request.fields["name"] = username.text;
      request.fields["quali"] = qualification.text;
      request.fields["spec"] = specialization.text;
      request.fields["contact"] = contact.text;
      request.fields["address"] = address.text;
      request.fields["location"] = location.text;
      request.fields["fees"] = fees.text;
      request.fields["time"] = time.text;
      request.fields["gender"] = _selectedGender;
      // request.fields["desig"] = designationName!;
      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        username.clear();
        qualification.clear();
        specialization.clear();
        contact.clear();
        address.clear();
        location.clear();
        fees.clear();
        time.clear();
        uploadimage = null;
        print("Success");
        //showModalBox("Success", "Data is Submitted Successfully", context);
        // ignore: avoid_print
        print(res);
      } else {
        setState(() {
          isLoading = false;
          //showModalBox("Error", "Data is not Submitted Successfully", context);
        });
      }
    } else {
      setState(() {
        //showModalBox("Error", "Please Filled All Field Properly", context);
        isLoading = false;
      });
    }
  }
  /// ********** CODE FOR DATA BASE ENDS *******/



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Pic"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
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
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: username,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: qualification,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                labelText: "Qualification",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: specialization,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                labelText: "Specialization",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: contact,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                labelText: "Contact No",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller:address,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.house,
                                  color: Colors.white,
                                ),
                                labelText: "Address",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: location,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                                labelText: "Location",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: fees,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.ten_k_outlined,
                                  color: Colors.white,
                                ),
                                labelText: "Fees",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),  Card(
                        color: Color(0xFF111D3A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: time,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.watch,
                                  color: Colors.white,
                                ),
                                labelText: "Timing",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Card(
                        color: Color(0xFF111D3A),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Gender :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.white),
                                child: Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 'male',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value.toString();
                                        });
                                      },
                                      activeColor: Colors.white,
                                      toggleable: true,
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Radio(
                                      value: 'female',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value.toString();
                                        });
                                      },
                                      activeColor: Colors.white,
                                      toggleable: true,
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Radio(
                                      value: 'other',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value.toString();
                                        });
                                      },
                                      activeColor: Colors.white,
                                      toggleable: true,
                                    ),
                                    Text(
                                      'Other',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),



                      RaisedButton(onPressed: uploadDoctorInfo,
                        color: Color(0xFF111D3A),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],),
                ),
              ],
            ),
          ),
        ),
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