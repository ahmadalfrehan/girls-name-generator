import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new033/cc..dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<Controller> {
  MyApp({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Icon(Icons.abc),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField(
            //   controller: controller.textEditingController,
            //   decoration: InputDecoration(labelText: 'Enter characters'),
            //   onChanged: controller.sendInput,
            // ),
            // SizedBox(
            //   height: 500,
            //   child: StreamBuilder(
            //     stream: controller.channel.stream,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.active) {
            //         if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         } else if (snapshot.hasData) {
            //           controller.generatedName = snapshot.data.toString();
            //         }
            //       }
            //       return Text(
            //         controller.generatedName.isEmpty
            //             ? 'Enter characters to generate name'
            //             : 'Generated Name: $controller.generatedName',
            //         style: TextStyle(fontSize: 20),
            //       );
            //     },
            //   ),
            // ),
            Obx(
              () => Expanded(
                // height: 260,
                child: ListView.builder(
                    itemCount: controller.r.value.length,
                    itemBuilder: (context, inx) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(controller.r.value[inx]),
                      );
                    }),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.get_app),
          onPressed: () async {
            controller.getInfor();
          },
        ),
      ),
    );
  }
}
