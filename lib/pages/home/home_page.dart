// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';
import 'package:garduino_dashboard/pages/home/widgets/activity_details_card.dart';
import 'package:garduino_dashboard/pages/home/widgets/avg_graph.dart';
import 'package:garduino_dashboard/pages/home/widgets/bar_graph_card.dart';
import 'package:garduino_dashboard/pages/home/widgets/header_widget.dart';
import 'package:garduino_dashboard/pages/home/widgets/single_bar_graph.dart';
import 'package:garduino_dashboard/responsive.dart';
import 'package:garduino_dashboard/pages/home/widgets/line_chart_card.dart';
import 'package:garduino_dashboard/widgets/custom_card.dart';

import 'widgets/pie_chart_widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(scaffoldKey: scaffoldKey),
              const SizedBox(
                height: 8,
              ),
              //Port Jobs Stats
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Port Jobs Stats',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomCard(
                      color: cardBackgroundColor,
                      child: Text(
                        'Total Number of Jobs: 3000 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              const ActivityDetailsCard(),
              _height(context),
              LineChartCard(title: 'Jobs with expiring free time'),
              _height(context),
              BarGraphCard(),
              _height(context),

              //Port Vassel Stats
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Port Vassel Stats',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomCard(
                      color: cardBackgroundColor,
                      child: Text(
                        'Total Number of Vassel: 2000 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Vessels by Type',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.31,
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          child: const PieChartSample2()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.65,
                        child: LineChartCard(
                          title: 'Average Horsepower and Tonnage:',
                        )),
                  ),
                ],
              ),
              _height(context),
              //business stats
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'General Business Stats',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomCard(
                      color: cardBackgroundColor,
                      child: Text(
                        'Total in Revenue : 2.3M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
              ),
              _height(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.46,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: LineChartCard(
                          title: 'Revenue Trend',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.46,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: const Expanded(
                            child: SingleBarGraph(title: 'Busiest Periods'))),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
