import 'package:flapkap_challenge/ui/screens/dashboard_screen.dart';
import 'package:flapkap_challenge/ui/screens/orders_charts_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(40, 13, 255, 1),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.dashboard_outlined)),
                Tab(icon: Icon(Icons.data_exploration_outlined)),
              ],
            ),
            title: Text('FlapKap Challenge'),
          ),
          body: TabBarView(
            children: <Widget>[
              DashboardScreen(),
              OrderChartsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
