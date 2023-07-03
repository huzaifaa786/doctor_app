// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard(
      {super.key, this.name, this.dateTime, this.hospital, this.image});
  final name;
  final hospital;
  final dateTime;
  final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                ClipRRect(
                        borderRadius: BorderRadius.circular(10), child: image)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pt.' + name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    dateTime,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                  Text(
                    hospital,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
