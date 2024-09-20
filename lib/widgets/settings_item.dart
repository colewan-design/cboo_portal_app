import 'package:cboo_portal_app/widgets/forward_button.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  final String? value;
  const SettingsItem(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.iconColor,
      required this.icon,
      required this.onTap,
      this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            value != null
                ? Text(
                    value!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              width: 20,
            ),
            ForwardButton(
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
