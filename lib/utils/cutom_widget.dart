import 'package:flutter/material.dart';

import '../constant/common_functions.dart';
import 'colors.dart';

class AuthButtonWidget extends StatelessWidget {
  AuthButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.btnWidth});
  String title;
  VoidCallback onPressed;
  double btnWidth;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width * btnWidth, height * 0.06),
          backgroundColor: amber),
      child: Text(
        title,
        style: textTheme.displaySmall!,
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [white, greyShade3, white],
          )),
        ),
        CommonFunctions.blankSpace(height: height * 0.02, width: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Condition of Use',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy Notice',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Help',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(height: height * 0.01, width: 0),
        Text(
          '© 1996-2024, Amazon.com, Inc. or its affliates',
          style: textTheme.labelMedium!.copyWith(color: grey),
        ),
      ],
    );
  }
}
