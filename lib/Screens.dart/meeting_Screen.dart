import 'package:dev_meets/Constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.h.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(() {}, "New Meeting", (Icons.videocam)),
            HomeMeetingButton(() {}, "Join Meeting", (Icons.add_box_rounded)),
            HomeMeetingButton(() {}, "Schedule ", (Icons.calendar_today)),
            HomeMeetingButton(
                () {}, "Share Screen", (Icons.arrow_upward_rounded)),
          ],
        ),
        Expanded(
            child: Center(
          child: Text("Create/Join Meetings with just a click",
              softWrap: true,
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              )),
        ))
      ],
    );
  }
}
