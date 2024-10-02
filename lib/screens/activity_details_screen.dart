import 'package:cboo_portal_app/screens/navigation_screen.dart';
import 'package:cboo_portal_app/widgets/pie_chart_badge.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ActivityDetailsScreen extends StatefulWidget {
  final String name;
  final IconData iconData;
  final Color color;
  final String type;
  final String typeTitle;

  const ActivityDetailsScreen({
    super.key,
    required this.name,
    required this.iconData,
    required this.color,
    required this.type,
    required this.typeTitle,
  });

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationScreen(),
                  ));
            },
            icon: Icon(Ionicons.arrow_back),
          ),
          leadingWidth: 80,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align children at the start
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the cards horizontally
              children: [
                SizedBox(height: 40),
                // First Card with Background Color
                Container(
                  width: screenWidth * 0.9,
                  child: Card(
                    color: Colors.blue[50],
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              width: 100, // Set your desired width
                              height: 100,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  }),
                                  sections: piechartSecion(),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for Button 1
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.teal, // Set the button color here
                      ),
                      child: Text(
                        "Download",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Action for Button 2
                      },
                      child: Text(
                        "Raise Issue",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earnings",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              buildRow("Basic Salary:", "\$2000"),
                              buildRow("Leave Encashment:", "\$500"),
                              buildRow("Other Allowance:", "\$1500"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deductions",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              buildRow("Basic Salary:", "\$1800"),
                              buildRow("Deductions:", "\$300"),
                              buildRow("Net Pay:", "\$1500"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payslip 3",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              buildRow("Basic Salary:", "\$2200"),
                              buildRow("Deductions:", "\$400"),
                              buildRow("Net Pay:", "\$1800"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(amount),
      ],
    );
  }

  List<PieChartSectionData> piechartSecion() {
    List<Color> sectionColors = [Colors.red, Colors.green];

    return List.generate(2, (i) {
      double value = (i + 1) * 10;
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 40.0 : 30.0;
      final fontSize = isTouched ? 14.0 : 12.0;
      final widgetSize = isTouched ? 30.0 : 20.0;
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
          badgePositionPercentageOffset: 0.98);
    });
  }
}
