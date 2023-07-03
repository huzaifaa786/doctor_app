import 'package:doctor_app/api/order.dart';
import 'package:doctor_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getdoctors();
    });
  }
   getdoctors() async {
    var mDoctors = await OrderApi.orderget();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleSwitch(
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: Colors.black,
                  minWidth: 190.0,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  activeBgColors: [
                    [mainColor],
                    [mainColor],
                  ],
                  labels: ['Today', 'previous'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            //  controller.notifications.length != 0
            //     ? Padding(
            //         padding: const EdgeInsets.only(left: 12, right: 12),
            //         child: Flexible(
            //           child: Container(
            //             height: MediaQuery.of(context).size.height * 0.81,
            //             child: ListView.builder(
            //                 itemCount: controller.notifications.length,
            //                 itemBuilder: (context, index) => NotificationTile(
            //                       ontap: controller.notifications[index].orderr!
            //                                   .status ==
            //                               '3'
            //                           ? () {
            //                               showModalBottomSheet(
            //                                 context: context,
            //                                 isScrollControlled: true,
            //                                 shape: const RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.vertical(
            //                                     top: Radius.circular(40),
            //                                   ),
            //                                 ),
            //                                 builder: (context) => Wrap(
            //                                     children: [
            //                                       NotificationModal(
            //                                           notification: controller
            //                                               .notifications[index])
            //                                     ]),
            //                               );
            //                             }
            //                           : () {},
            //                       name: controller
            //                           .notifications[index].vendor!.username,
            //                       image: controller
            //                           .notifications[index].vendor!.profilePic,
            //                       title: controller.notifications[index].title,
            //                       status: controller
            //                           .notifications[index].orderr!.status,
            //                     )),
            //           ),
            //         ),
            //       )
            // : Flexible(
            //     child: Container(
            //       height: MediaQuery.of(context).size.height * 0.81,
            //       width: MediaQuery.of(context).size.width,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Text("No Notification Found!"),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        ),
      )),
    );
  }
}
