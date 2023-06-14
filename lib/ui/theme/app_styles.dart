import 'package:flutter/cupertino.dart';
import 'package:template/ui/theme/app_colors.dart';

abstract class AppStyles {
  AppStyles._();

  static const fontStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
}
