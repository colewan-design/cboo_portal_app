import 'package:flutter/material.dart';

class PieChartBadge extends StatelessWidget {
  const PieChartBadge({
    super.key,
    required this.icon,
    required this.size,
    required this.borderColor,
  });
  final double size;
  final IconData icon;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.long1,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
