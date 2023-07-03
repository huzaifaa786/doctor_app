import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    this.doctorname,
    this.name,
    this.hospital,
    this.appointment,
  }) : super(key: key);

  final doctorname;
  final name;
  final hospital;
  final appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      // height: 120,
      decoration: const BoxDecoration(
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black45),
                child: Image.asset(
                  'assets/images/doctor.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorname,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.grey),
                ),
                Row(
                  children: [Icon(Icons.calendar_month), Text(appointment)],
                ),
                Row(
                  children: [Icon(Icons.location_on), Text(hospital)],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
