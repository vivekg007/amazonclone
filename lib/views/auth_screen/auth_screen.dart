import 'package:amazonclone/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constant/common_functions.dart';
import '../../utils/cutom_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  String currentCountryCode = '+91';
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: height * 0.04,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CommonFunctions.blankSpace(
                  height: height * 0.02,
                  width: 0,
                ),
                Builder(builder: (context) {
                  if (isLogin) {
                    return signIn(width, height, textTheme, context);
                  }
                  return createAccount(width, height, textTheme, context);
                }),
                CommonFunctions.blankSpace(height: height * 0.05, width: 0),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: greyShade3,
                ),
              ),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: grey,
                      ),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: isLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  height: 0,
                  width: width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account. ',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'New to Amazon? ',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: grey,
                          ),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: isLogin ? secondaryColor : transparent,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isLogin = true;
                        });
                      },
                    ),
                    CommonFunctions.blankSpace(
                      height: 0,
                      width: width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sign in. ',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: 'Already a customer',
                              style: textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height: height * 0.01, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.64,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: mobileNumber,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(7.0),
                          hintText: 'Mobile number',
                          hintStyle: textTheme.displaySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: secondaryColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height: height * 0.02, width: 0),
                AuthButtonWidget(
                  title: 'Continue',
                  onPressed: () {},
                  btnWidth: 0.88,
                ),
                CommonFunctions.blankSpace(height: height * 0.02, width: 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'By Continuing you agree to Amazon\'s',
                          style: textTheme.labelMedium),
                      TextSpan(
                          text: ' Condition of use',
                          style: textTheme.labelMedium!.copyWith(color: blue)),
                      TextSpan(text: ' and ', style: textTheme.labelMedium),
                      TextSpan(
                          text: 'Privacy Notice',
                          style: textTheme.labelMedium!.copyWith(color: blue)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createAccount(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: grey,
                          ),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: isLogin ? transparent : secondaryColor,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isLogin = false;
                        });
                      },
                    ),
                    CommonFunctions.blankSpace(
                      height: 0,
                      width: width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create Account. ',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: 'New to Amazon?',
                              style: textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height: height * 0.01, width: 0),
                SizedBox(
                  height: height * 0.06,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(7.0),
                      hintText: 'First and Last Name',
                      hintStyle: textTheme.bodySmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(height: height * 0.01, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.64,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: mobileNumber,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(7.0),
                          hintText: 'Mobile number',
                          hintStyle: textTheme.bodySmall,
                          //hintStyle: textTheme.displaySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: secondaryColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height: height * 0.02, width: 0),
                Text(
                  "By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rate may apply.",
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(height: height * 0.02, width: 0),
                AuthButtonWidget(
                  title: "Verify Mobile Number",
                  onPressed: () {},
                  btnWidth: 0.88,
                ),
                CommonFunctions.blankSpace(height: height * 0.02, width: 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'By Continuing you agree to Amazon\'s',
                          style: textTheme.labelMedium),
                      TextSpan(
                          text: ' Condition of use',
                          style: textTheme.labelMedium!.copyWith(color: blue)),
                      TextSpan(text: ' and ', style: textTheme.labelMedium),
                      TextSpan(
                          text: 'Privacy Notice',
                          style: textTheme.labelMedium!.copyWith(color: blue)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: greyShade3,
                ),
              ),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: grey,
                      ),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: isLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  height: 0,
                  width: width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign In. ',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Already a Customer? ',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
