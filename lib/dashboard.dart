import 'package:flutter/material.dart';
import 'package:garduino_dashboard/pages/home/home_page.dart';
import 'package:garduino_dashboard/Responsive.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(flex: 8, child: HomePage(scaffoldKey: _scaffoldKey)),
          ],
        ),
      ),
    );
  }
}
