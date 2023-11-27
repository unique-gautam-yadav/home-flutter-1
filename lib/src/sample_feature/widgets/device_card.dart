import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.activeColor,
    required this.deviceIcon,
    required this.connectionIcon,
    required this.isActive,
    this.onActivePressed,
    required this.title,
    required this.subtitle,
  });

  final MaterialColor activeColor;
  final IconData deviceIcon;
  final IconData connectionIcon;
  final bool isActive;
  final void Function(bool)? onActivePressed;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onActivePressed != null) {
          onActivePressed!(!isActive);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  deviceIcon,
                  color: isActive ? Colors.white : activeColor,
                  size: 50,
                ),
                Icon(
                  connectionIcon,
                  color: isActive ? Colors.white : Colors.grey,
                  size: 20,
                ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            Divider(
              color: isActive ? Colors.white38 : Colors.black12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedCrossFade(
                  firstChild: const Text(
                    "On",
                    style: TextStyle(color: Colors.white),
                  ),
                  secondChild: const Text("Off"),
                  crossFadeState: isActive
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                ),
                Switch(
                  activeColor: Colors.white,
                  // trackColor: activeColor,
                  value: isActive,
                  onChanged: onActivePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
