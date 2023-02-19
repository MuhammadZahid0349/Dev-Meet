import 'package:dev_meets/Constants/ColorConstants.dart';
import 'package:dev_meets/Resourses/auth_methods.dart';
import 'package:dev_meets/Screens.dart/home_Screen.dart';
import 'package:dev_meets/Screens.dart/login_Screen.dart';
import 'package:dev_meets/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 40.0
    ..radius = 15.0
    ..progressColor = KSecColor
    ..backgroundColor = kPrimaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..textStyle = const TextStyle(fontSize: 22, fontStyle: FontStyle.italic)
    ..maskColor = Colors.grey.withOpacity(0.7)
    ..userInteractions = true
    ..maskType = EasyLoadingMaskType.custom
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dev Meet',
            builder: EasyLoading.init(),
            home: StreamBuilder(
              stream: authChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // EasyLoading.show(); //return Circularprogressbar
                }
                if (snapshot.hasData) {
                  return HomeScreen();
                }
                return LoginScreen();
              },
            ),
          );
        });
  }
}
