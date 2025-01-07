import 'package:flutter/material.dart';


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


        ],
      ),
    );
  }
}
