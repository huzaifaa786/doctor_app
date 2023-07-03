// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:doctor_app/api/auth.dart';
import 'package:doctor_app/screens/home/home.dart';
import 'package:doctor_app/static/button.dart';
import 'package:doctor_app/static/inputfield.dart';
import 'package:doctor_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if (emailController.text == '' || passwordController.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await AuthApi.login(
        emailController.text.toString(),
        passwordController.text.toString(),
      )) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome, on Instant Dr.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(bottom: 66, top: 8),
              //   child: Text(
              //     'Login now for find doctor',
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         fontSize: 17,
              //         color: Color.fromARGB(255, 29, 132, 33)),
              //   ),
              // ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(bottom: 21),
                child: InputField(
                  hint: 'Enter Your Email:',
                  controller: emailController,
                  type: TextInputType.emailAddress,

                ),
              ),
              InputField(
                hint: 'Enter Your Password:',
                obscure: true,
                controller: passwordController,

              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 28),
                child: LargeButtons(
                  title: 'Login',
                  color: mainColor,
                  screenRatio: 0.7,
                  onPressed: () {
                    login();
                  },
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
