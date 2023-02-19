import 'package:dev_meets/Constants/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Center RowLineText(var Name) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 2.h,
          width: Get.width * 0.15,
          color: kPrimaryColor,
        ),
        Container(
          height: 40.h,
          width: 40.w,
          child: Image(
            image: AssetImage('assets/images/p1.png'),
            fit: BoxFit.contain,
          ),
        ),
        Text("\t\t ${Name} \t\t",
            style: GoogleFonts.josefinSans(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            )),
        Container(
          height: 40.h,
          width: 40.w,
          child: Image(
            image: AssetImage('assets/images/p2.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          height: 2.h,
          width: Get.width * 0.15,
          color: kPrimaryColor,
        ),
      ],
    ),
  );
}

GestureDetector BackBtn() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 6.w),
      height: 36.h,
      width: 36.w,
      decoration: BoxDecoration(
        color: KSecColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: kPrimaryColor,
        size: 25.sp,
      ),
    ),
  );
}

CustomizedSnackBar(var title, var message) {
  Get.snackbar(
    "$title", "$message",
    colorText: kPrimaryColor,
    borderRadius: 30.r,
    margin: EdgeInsets.all(10),
    animationDuration: Duration(milliseconds: 3000),
    backgroundGradient: LinearGradient(colors: [Colors.white, Colors.blue]),
    //// while using border color ensure you are using border width also
    borderWidth: 4,
    // boxShadows: [
    //   BoxShadow(
    //       color: Colors.yellow,
    //       offset: Offset(30, 50),
    //       spreadRadius: 20.r,
    //       blurRadius: 8)
    // ],
    // isDismissible: true, //close and open condition of Snackbar
    // dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.bounceInOut,
    duration: Duration(milliseconds: 8000), // visible Time
    // icon: Icon(
    //   Icons.send,
    //   color: Colors.black,
    // ),
    // shouldIconPulse: false, // icon not animated
    // leftBarIndicatorColor: Colors.amber,
    // mainButton: TextButton(onPressed: () {}, child: Text("Retry")),
    // onTap: (val) {
    //   print("Snackbar Clicked");
    // },
    // overlayBlur: 5, //background screen will be blur
    // overlayColor: Colors.grey.withOpacity(0.5),
  );
}

GestureDetector HomeMeetingButton(
    VoidCallback onPressed, var text, IconData icon) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: KSecColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.r,
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          width: 60.w,
          height: 60.h,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
        10.h.heightBox,
        Text(text,
            style: GoogleFonts.josefinSans(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ))
      ],
    ),
  );
}
