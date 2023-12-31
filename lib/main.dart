import 'package:doctor_app/helpers/loading.dart';
import 'package:doctor_app/screens/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  update() {
    setState(() {});
  }

  @override
  void initState() {
    LoadingHelper.onChangeAbsorbClick = update;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "Doctor",
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
        // 'home': (context) => const BottomNavScreen(),
        // 'booking_confirm': (context) => const BookingConfirm(),
        // 'order_status': (context) => const OrderStatus(),
        // 'notification': (context) => const NotificationScreen(),
        // 'profile': (context) => const ProfileScreeen(),
        // 'order_histary': (context) => const OrderHistry(),
        // 'edit_profile': (context) => const EditProfile(),
        // 'intro': (context) => const IntroScreen(),
        // 'forgot_screen': (context) => ForgotScreen(),
        // 'Lang': (context) => TranslateScreen(),
      },
    );
  }
}
