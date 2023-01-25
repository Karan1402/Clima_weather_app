import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter_2/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter_2/services/weather.dart';
// const apiKey = '6f99e96b2042bb3dbe9b2c2b22dcbaee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // late double latitude;
  // late double longitude;
  @override
  void initState() {
    super.initState();
    print('this line of code is triggered');
    getLoctionData();
  }

  void getLoctionData() async {
    // Location location = Location();
    // await location.getCurrentLoction();
    // // longitude = location.longitude;
    // // latitude = location.latitude;
    //
    // NetworkHelper networkHelper =NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    //
    // var weatherData=await networkHelper.getData();

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationweather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
