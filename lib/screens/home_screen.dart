import 'package:cboo_portal_app/screens/activity_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning, BSU",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "1 October 2024",
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.secondary,
                    image: DecorationImage(
                      image: AssetImage("images/user1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          // Usage in your Row

          SizedBox(
            height: 130,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the children
              children: [
                SizedBox(width: 20), // Optional padding on the left
                Expanded(
                  child: homeCard("Payslips", 12, "records",
                      Theme.of(context).colorScheme.secondary, "🖥️"),
                ),
                SizedBox(width: 20), // Space between cards
                Expanded(
                  child: homeCard("Deductions", 5, "records",
                      Theme.of(context).colorScheme.secondary, "🖥️"),
                ),
                SizedBox(width: 20), // Optional padding on the right
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recent Activities",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              recentActivitiesList(
                "Mid Year Bonus",
                Icons.star_half_outlined, // Replace with your chosen icon
                Colors.blueAccent,
                "15 May 2024",
              ),
              recentActivitiesList(
                "Payslip",
                Icons.payment, // Replace with your chosen icon
                Colors.redAccent,
                "23 September 2024",
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget recentActivitiesList(
      String name,
      IconData iconData, // Change this line
      Color color,
      String typeTitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          String _type;
          if (color == Colors.blueAccent) {
            _type = "Mid Year Bonus";
          } else if (color == Colors.redAccent) {
            _type = "Payslip";
          } else if (color == Colors.orangeAccent) {
            _type = "Clothing Allowance";
          } else {
            _type = "Unknown"; // Default value or a fallback option
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActivityDetailsScreen(
                name: name,
                // Pass an icon name instead of an image
                iconData:
                    iconData, // You can keep it empty or modify ActivityDetailsScreen accordingly
                color: color,
                type: _type,
                typeTitle: typeTitle,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: color.withAlpha(7),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    iconData, // Use the icon data here
                    size: 30, // Adjust the size as needed
                    color: color,
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                typeTitle,
                style: TextStyle(color: Colors.black54),
              ),
              trailing: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color.withAlpha(10),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget homeCard(
      String name, int number, String title, Color color, String emoji) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        height: 130, // Set a fixed height or minimum height for consistency
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Round corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(10),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: 10), // Adjusted padding
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center contents vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        emoji,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Space between emoji and text
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              // number
              SizedBox(height: 5), // Space between rows
              Center(
                child: Text(
                  number.toString() + " " + title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // number
              SizedBox(height: 5), // Space between rows
              Text(
                number.toString() + " " + title,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
