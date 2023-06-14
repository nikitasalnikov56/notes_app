import 'package:flutter/material.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      this.title = '',
      this.text = '',
      this.date = '',
      required this.index})
      : super(key: key);
  final String title;
  final String text;
  final int index;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
      color: AppColors.backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.fontStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: AppStyles.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: AppStyles.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     color: AppColors.backGroundColor,
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   padding: const EdgeInsets.all(16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         title,
    //         style: AppStyles.fontStyle.copyWith(
    //           fontWeight: FontWeight.w500,
    //           fontSize: 16,
    //         ),
    //       ),
    //       const SizedBox(height: 5),
    //       Text(
    //         date,
    //         style: AppStyles.fontStyle.copyWith(
    //           fontSize: 14,
    //           color: AppColors.lightGrey,
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Text(
    //         text,
    //         style: AppStyles.fontStyle.copyWith(
    //           fontSize: 14,
    //           color: AppColors.textGrey,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
