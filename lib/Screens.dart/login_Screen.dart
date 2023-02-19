import 'package:dev_meets/Constants/ColorConstants.dart';
import 'package:dev_meets/Resourses/auth_methods.dart';
import 'package:dev_meets/Screens.dart/home_Screen.dart';
import 'package:dev_meets/Widgets/customizted_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 40.h.heightBox,
                Text('Start or join a meeting'.toUpperCase(),
                    softWrap: true,
                    style: GoogleFonts.josefinSans(
                      color: KSecColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                    )),
                15.h.heightBox,
                Container(
                    height: 400.h, child: Image.asset("assets/images/bg.png")),
                60.h.heightBox,
                Container(
                  height: 50.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: KSecColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: CustomButton(
                    onPressed: () async {
                      bool res = await signInWithGoogle();
                      if (res) {
                        Get.to(() => HomeScreen());
                      }
                    },
                    text: "Google Sign In",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
