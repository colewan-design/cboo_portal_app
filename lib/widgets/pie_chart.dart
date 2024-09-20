import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            swapAnimationDuration: Duration(milliseconds: 750),
            PieChartData(sections: [
              PieChartSectionData(
                value: 100,
                color: Colors.blue,
              ),
              PieChartSectionData(
                value: 20,
                color: Colors.red,
              ),
              PieChartSectionData(
                value: 20,
                color: Colors.green,
              ),
              PieChartSectionData(
                value: 20,
                color: Colors.yellow,
              ),
            ]),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "2000",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Basic Salary"),
            ],
          ),
        ],
      ),
    );
  }
}
