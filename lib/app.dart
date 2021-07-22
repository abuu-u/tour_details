import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/tour_details.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const MaterialApp(
      home: TourDetails(),
      debugShowCheckedModeBanner: false,
    );
  }
}
