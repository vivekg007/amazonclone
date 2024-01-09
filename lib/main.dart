import 'package:amazonclone/utils/theme.dart';
import 'package:amazonclone/views/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: OTPScreen(
        mobileNumber: '+9111125252555',
      ),
    );
  }
}
