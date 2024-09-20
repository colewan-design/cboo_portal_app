import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxBarHeight = 220;
    return Column(
      children: [
        Text(
          "Monthly Gross Payments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Ionicons.chevron_back),
            ),
            Text(
              "Sept 1, 2024 - Sept 31, 2024",
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Ionicons.chevron_forward),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          //the bars ad whole data would depend on the dynamic data
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i = 30; i < maxBarHeight; i += 30)
              Column(
                children: [
                  Text(
                    "\₱$i",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: i.toDouble(),
                    width: 18,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sun",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}
