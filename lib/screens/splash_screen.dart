import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hashlob_task/constant.dart';
import 'package:hashlob_task/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/ProductListScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple, Colors.deepOrange],
          )),
          child: Center(
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
        ),
      )),
    );
  }
}
