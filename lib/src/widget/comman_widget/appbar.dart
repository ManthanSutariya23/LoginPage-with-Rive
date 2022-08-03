import 'package:flutter/material.dart';
import 'package:loginwithrive/src/config/colors.dart';
import 'package:loginwithrive/src/config/text_style.dart';

PreferredSizeWidget appBar({
  @required BuildContext? context,
  @required String? title,
  bool? isLeading = false,
  Function()? onTap,
}) {
  return AppBar(
    backgroundColor: AppColors.appGreenColor,
    elevation: 0,
    leading: isLeading! ? GestureDetector(
      onTap: onTap ?? () {
        Navigator.pop(context!);
      },
      child: Icon(
        Icons.arrow_back,
        size: 28,
        color: AppColors.whiteColor,
      ),
    )
    : null,
    title: Text(
      title!,
      style: AppTextStyle.regular14.copyWith(fontWeight: FontWeight.bold,color: AppColors.whiteColor),
    ),
  );
}


PreferredSizeWidget appBarHome({
  @required BuildContext? context,
  @required String? title,
  @required Function()? onTap,
  bool? changeIcon,
  List<Widget>? action,
  bool isAction = false
}) {
  return AppBar(
    backgroundColor: AppColors.appGreenColor,
    actions: isAction ? action! : null,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
    title: InkWell(
      onTap: () {},
      child: Text(
        title!,
        style: AppTextStyle.regular14.copyWith(fontWeight: FontWeight.bold,color: AppColors.whiteColor),
      ),
    ),
  );
}


