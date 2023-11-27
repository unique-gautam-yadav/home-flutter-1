import 'package:flutter/material.dart';

class StatusDivider extends StatelessWidget {
  const StatusDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      height: 20,
      width: 2,
      color: Colors.grey.withOpacity(.3),
    );
  }
}
