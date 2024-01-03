import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/model/graph_model.dart';
import 'package:garduino_dashboard/responsive.dart';
import 'package:garduino_dashboard/widgets/custom_card.dart';

import '../../../model/bar_graph_model.dart';

class SingleBarGraph extends StatefulWidget {
  const SingleBarGraph({super.key, required this.title});
  final String title;
  @override
  State<SingleBarGraph> createState() => SingleBarGraphState();
}

class SingleBarGraphState extends State<SingleBarGraph> {
  final lable = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final nums = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  List<BarGraphModel> inst = [
    BarGraphModel(lable: "Port stat", color: const Color(0xFF20AEF3), graph: [
      GraphModel(x: 0, y: 7),
      GraphModel(x: 1, y: 9),
      GraphModel(x: 2, y: 7),
      GraphModel(x: 3, y: 4),
      GraphModel(x: 4, y: 4),
      GraphModel(x: 5.2, y: 9),
      GraphModel(x: 6, y: 9),
      GraphModel(x: 7, y: 8),
      GraphModel(x: 8, y: 9),
      GraphModel(x: 9, y: 9),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups:
                      _chartGroups(points: inst[0].graph, color: inst[0].color),
                  borderData: FlBorderData(border: const Border()),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            lable[value.toInt()],
                            style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    )),
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(nums[value.toInt()].toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              )),
                        );
                      },
                    )),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  List<BarChartGroupData> _chartGroups(
      {required List<GraphModel> points, required Color color}) {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                toY: point.y,
                width: 12,
                color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              )
            ]))
        .toList();
  }
}
