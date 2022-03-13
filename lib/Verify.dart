import 'dart:convert';
import 'dart:developer';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:ecom/RegisterForm.dart';
import 'package:ecom/devicedetial.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
class Verify extends StatefulWidget {
  String Verifyid;
  Verify(this.Verifyid);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}

class _VerifyState extends State<Verify> {
  @override



  late String board, brand, device, hardware, host, iddevice, manufacture, model, product, type, androidid;
  late bool isphysicaldevice;
  String token1 = "";
  DeviceInfoPlugin deviceInfo =
  DeviceInfoPlugin(); // instantiate device info plugin
  late AndroidDeviceInfo androidDeviceInfo;

  Future<void> firebaseCloudMessagingListeners()
  async {
    String? token = await FirebaseMessaging.instance.getToken();

    // ignore: avoid_print
    print("Token1:" + token!);
  }
  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
    uploaddeviceInfo();

  }



  String smsOtp = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.green.shade300,
          child: ListView(children: <Widget>[
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
                "Enter OTP Send On Your Mobile Number",
                style: TextStyle(
                  color: Colors.black,

                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 8.0,
                        offset: Offset(5, 5))
                  ]),
              height: 220,
              margin: EdgeInsets.all(25),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(

                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    PinEntryTextField(

                      showFieldAsBox: true,
                      fields: 6,
                      onSubmit: (text) {
                        smsOtp = text as String;
                      },
                    ),
                  ]),
                ),
                SizedBox(height: 50),
                //ElevatedButton(onPressed: () {}, child: Text("CONTINUE")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        log("RESEND BUTTON PRESS");
                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Resend",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        log("CONTINUE BUTTON PRESS");
                        uploaddeviceInfo();
                        GetTokenPage();
                        log("TOKEN CRAETED");

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterForm()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )
          ]),
        )
      ]),
    );
  }

  void uploaddeviceInfo() {

    void getDeviceinfo() async {

      var data = {
        "board": board.toString(),
        "brand": brand.toString(),
        "device": device.toString(),
        "hardware": hardware.toString(),
        "host": host.toString(),
        "iddevice": iddevice.toString(),
        "manufacture": manufacture.toString(),
        "model": model.toString(),
        "product": product.toString(),
        "type": type.toString(),
        //"isphysicaldevi": .toString(),
        "androidid": androidid.toString(),
      };

      var response = await http.post(
          Uri.parse(
              "https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/json_deviceinfo.php"),

          body: json.encode(data));
      var obj = jsonDecode(response.body);

      if (obj['result'] == "S") {
        print("Device info save");

      }
      else {
        print("Failed to saved");
      }


































    }
  }
}
