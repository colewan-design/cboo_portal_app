import 'package:cboo_portal_app/widgets/pie_chart_badge.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double SpendAmount = 250;
    final double TotalBudget = 500;
    final double radialBarPercent = SpendAmount / SpendAmount;
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Basic Salary"),
    );
  }

  Widget _buildUI() {
    return Center(
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          }),
          sections: piechartSecion(),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
        ),
      ),
    );
  }

  List<PieChartSectionData> piechartSecion() {
    List<Color> sectionColors = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green
    ];
    List<IconData> sectionIcons = [
      Icons.business,
      Icons.shopping_bag,
      Icons.local_grocery_store,
      Icons.house,
    ];
    return List.generate(4, (i) {
      double value = (i + 1) * 10;
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 150.0 : 100.0;
      final fontSize = isTouched ? 24.0 : 16.0;
      final widgetSize = isTouched ? 60.0 : 40.0;
      return PieChartSectionData(
          color: sectionColors[i],
          value: value,
          title: '$value%',
          radius: radius,
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.white70,
          ),
          badgeWidget: PieChartBadge(
            icon: sectionIcons[i],
            size: widgetSize,
            borderColor: Colors.black,
          ),
          badgePositionPercentageOffset: 0.98);
    });
  }
}
