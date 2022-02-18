import 'package:flutter/material.dart';
import 'package:hashlob_task/screens/product_list_screen.dart';
import 'package:hashlob_task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple)),
      initialRoute: '/',
      // home: SplashScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/ProductListScreen': (context) => ProductListScreen(),
      },
    );
  }
}
