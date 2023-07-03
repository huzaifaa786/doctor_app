// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:doctor_app/api/auth.dart';
import 'package:doctor_app/api/order.dart';
import 'package:doctor_app/models/appointments.dart';
import 'package:doctor_app/screens/login/login.dart';
import 'package:doctor_app/static/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Appointments> appointments = [];
  getAppointments() async {
    var mappointments = await OrderApi.getAppointments();
    setState(() {
      appointments = mappointments;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getAppointments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant Doctor'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () async {
                await AuthApi.logout();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Icon(Icons.logout_outlined))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            SizedBox(height: 8),
            Flexible(
              child: SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appointments.length,
                    itemBuilder: (BuildContext context, int index) {
                      String dateTime =
                          appointments[index].time! + appointments[index].date!;
                      return AppointmentCard(
                        image: appointments[index].image == null
                            ? Image.asset(
                                'assets/images/5907.jpg',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              )
                            : Image(
                                image: NetworkImage(appointments[index].image!),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover),
                        name: appointments[index].drName,
                        dateTime: dateTime,
                        hospital: appointments[index].hospital,
                      );
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
