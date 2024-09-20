import 'package:cboo_portal_app/screens/navigation_screen.dart';
import 'package:cboo_portal_app/widgets/bar_chart.dart';
import 'package:cboo_portal_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class EmployeePayScreen extends StatelessWidget {
  const EmployeePayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            forceElevated: true,
            floating: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationScreen(),
                    ));
              },
              icon: Icon(
                Ionicons.arrow_back,
                size: 30,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("My Payments"),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BarChart(),
                  );
                } else {
                  return CategoryWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
