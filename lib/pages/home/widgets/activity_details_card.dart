import 'package:flutter/material.dart';
import 'package:garduino_dashboard/pages/home/widgets/avg_graph.dart';
import 'package:garduino_dashboard/pages/home/widgets/animated_bar_graph.dart';
import 'package:garduino_dashboard/pages/home/widgets/profits_graph.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.32,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: const Column(
            children: [
              Center(
                child: Text(
                  'Average Job Size Graph',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(child: AvgGraph()),
            ],
          )),
      const Padding(padding: EdgeInsets.all(8)),
      SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Weekly Jobs Completion Rate',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BarChartSample2(),
            ],
          )),
      const Padding(padding: EdgeInsets.all(8)),
      SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.31,
          height: MediaQuery.sizeOf(context).width * 0.30,
          child: const Column(
            children: [
              Center(
                child: Text(
                  'Last Quarter Profit Behavior',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              LineChartSample1(),
            ],
          )),
    ]);
  }
}
