import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:qiblah_flutter/screens/qibla_compass.dart';
import 'package:sensors/sensors.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double _gyroHeading = 0.0;
  double _compassHeading = 0.0;

  @override
  void initState() {
    super.initState();

    // Mengambil data dari sensor gyroscope
    gyroscopeEvents.listen((GyroscopeEvent event) {
      if (event.z != null) {
        setState(() {
          _gyroHeading =
              event.z! * (180 / 3.14159); // Mengubah radian menjadi derajat
        });
      }
    });

    // Mengambil data dari sensor kompas
    FlutterCompass.events!.listen((event) {
      if (event.heading != null) {
        setState(() {
          _compassHeading = event.heading!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Text(
              //   'Gyroscope Heading: ${_gyroHeading.toStringAsFixed(2)}°',
              //   style: TextStyle(fontSize: 24.0),
              // ),
              Text(
                'Kompas',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RotationTransition(
                turns: AlwaysStoppedAnimation(
                    -_compassHeading / 360), // Rotasi gambar kompas
                child:
                    Image.asset('assets/compass.png', width: 350, height: 350),
              ),
              Text(
                '${_compassHeading.toStringAsFixed(2)}°',
                style: TextStyle(fontSize: 24.0),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: 16), // Margin bawah agar tombol lebih rendah
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QiblaCompass(),
                        ),
                      );
                    },
                    child: Text('Kiblat'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
