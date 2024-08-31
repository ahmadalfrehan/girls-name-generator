import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

// class RModel {
//   List<String> genNames = [];
//
//   RModel({required this.genNames});
//
//   RModel.empty();
//
//   factory RModel.fromJson(Map<String, dynamic> data) {
//     return RModel(genNames:List.from(data['generated_names']).map((e) => ) data['generated_names']);
//   }
// }

class HttpR {
  getInfo() async {
    final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/generate_names/'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({"seed": 0, "num_names": 50}));
    log(response.body.toString());
    List<String>? rModel;
    var data = json.decode(response.body);
    rModel = List<String>.from(data['generated_names']);
    return rModel;
    log(response.statusCode.toString());
  }
}

class Controller extends GetxController {
  RxList<String> r = <String>[].obs;

  @override
  onInit() {
    getInfor();
    super.onInit();
  }

  getInfor() async {
    r.value = await HttpR().getInfo();
  }

  final TextEditingController textEditingController = TextEditingController();
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://127.0.0.1:8000/ws/generate_name'),
  );
  String generatedName = "";

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void sendInput(String input) {
    if (input.isNotEmpty) {
      channel.sink.add(input);
    }
  }
}
