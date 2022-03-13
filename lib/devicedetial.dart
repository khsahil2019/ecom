import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';



class GetTokenPage extends StatefulWidget {
  GetTokenPage(){}

  @override
  _GetTokenPageState createState() => _GetTokenPageState();
}

class _GetTokenPageState extends State<GetTokenPage> {
  String token1 = "";
  DeviceInfoPlugin deviceInfo =
  DeviceInfoPlugin(); // instantiate device info plugin
  late AndroidDeviceInfo androidDeviceInfo;

  late String board, brand, device, hardware, host, iddevice, manufacture, model, product, type, androidid;
  late bool isphysicaldevice;



  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo
        .androidInfo; // instantiate Android Device Infoformation
    setState(() {
      board = androidDeviceInfo.board;
      brand = androidDeviceInfo.brand;
      device = androidDeviceInfo.device;
      hardware = androidDeviceInfo.hardware;
      host = androidDeviceInfo.host;
      iddevice = androidDeviceInfo.id;
      manufacture = androidDeviceInfo.manufacturer;
      model = androidDeviceInfo.model;
      product = androidDeviceInfo.product;
      type = androidDeviceInfo.type;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice;
      androidid = androidDeviceInfo.androidId;
    });
  }




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
    getDeviceinfo();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );

  }


  Future<void> GetTokenPage() async {
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