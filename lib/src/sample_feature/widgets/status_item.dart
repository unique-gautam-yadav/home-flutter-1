import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
    required this.iconColor,
  });

  final IconData iconData;
  final String title;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 30,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
