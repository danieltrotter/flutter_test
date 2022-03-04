import 'package:flutter/material.dart';
import 'package:flutter_ptb/utils/widgets/colors.dart';

class PtbTexts {
  static Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
          color: PtbColors.whiteColor,
          fontSize: 40,
          fontWeight: FontWeight.bold),
    );
  }

  static Widget description(String description) {
    return Text(
      description,
      style: TextStyle(color: PtbColors.whiteColor, fontSize: 20),
    );
  }

  static Widget movieTitle(String title) {
    return Text(title,
        style: TextStyle(
            color: PtbColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold));
  }
}
