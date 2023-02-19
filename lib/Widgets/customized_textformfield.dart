import 'package:dev_meets/Constants/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedTextFormfield extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;

  const CustomizedTextFormfield(
      {Key? key, required this.myController, this.hintText, this.isPassword})
      : super(key: key);

  @override
  State<CustomizedTextFormfield> createState() =>
      _CustomizedTextFormfieldState();
}

class _CustomizedTextFormfieldState extends State<CustomizedTextFormfield> {
  bool _isVisible = false;

  void _showPassword() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isPassword!
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      enableSuggestions: widget.isPassword! ? false : true,
      // autocorrect: widget.isPassword! ? false : true,
      // obscureText: widget.isPassword! ? true : false,
      // obscureText: widget.isPassword ?? true,
      // obscureText: _isVisible ? true : false,
      obscureText: _isVisible ? false : widget.isPassword!,

      controller: widget.myController,
      validator: widget.isPassword!
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }
              // } else if (value.length < 6) {
              //   return 'Password must be greater then 6';
              // }
              return null;
            }
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Email';
              } else if (!value.contains('@')) {
                return 'Please enter Valid Email';
              } else if (!value.contains('.com')) {
                return 'Please enter Valid Email';
              }
              return null;
            },
      decoration: InputDecoration(
        // labelText: 'Email:',
        suffixIcon: widget.isPassword!
            ? IconButton(
                color: kPrimaryColor,
                icon: Icon(
                    _isVisible ? Icons.remove_red_eye : Icons.visibility_off),
                onPressed: () => _showPassword(),
              )
            : null,
        // errorText: ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        ////////////////////////////////
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        // errorText: _errorText,
      ),
    );
  }
}
