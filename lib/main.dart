import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:qiblah_flutter/screens/compass.dart';
import 'screens/qibla_compass.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: ThemeMode.system,
      // home: Scaffold(
      //   body: FutureBuilder(
      //     future: FlutterQiblah.androidDeviceSensorSupport(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(
      //             strokeWidth: 2,
      //           ),
      //         );
      //       }

      //       if (snapshot.hasError) {
      //         return Center(
      //           child: Text('Error: ${snapshot.error.toString()}'),
      //         );
      //       }
      //       if (snapshot.hasData) {
      //         return const QiblaCompass();
      //       } else {
      //         return const Text('Error');
      //       }
      //     },
      //   ),
      // ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Compass(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/logo.png',
        width: 200,
        height: 200,
      )),
    );
  }
}
