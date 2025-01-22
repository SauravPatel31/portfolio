import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BtnPage extends StatefulWidget {
  const BtnPage({super.key});

  @override
  State<BtnPage> createState() => _BtnPageState();
}

class _BtnPageState extends State<BtnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Page"),
      ),
      body: Column(
        children: [
          Container(
            width: 250,
            height: 250 ,
          ),
          ElevatedButton(
            onPressed: (){
              Get.changeTheme(ThemeData.dark());
              Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
              setState(() {

              });
            },
            child: Text("Dark Theme"),
          )


        ],
      ),
    );
  }
}
