import 'package:flutter/material.dart';

class OrderStatusContainer extends StatelessWidget {
  String? title;
  String? value;
  IconData? icon;
  Color? color;

  OrderStatusContainer({this.title, this.value, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 2))
          ],
        ),
        padding: const EdgeInsets.only(top: 12),
        width: MediaQuery.of(context).size.width / 3,
        height: 100,
        child: Column(
          children: [
            Icon(
              icon ?? Icons.not_accessible,
              color: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              value ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
