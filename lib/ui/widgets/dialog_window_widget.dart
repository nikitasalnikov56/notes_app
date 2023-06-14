import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/domain/providers/notes_provider.dart';
import 'package:template/generated/locale_keys.g.dart';
import 'package:template/ui/app_navigator/app_routes.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.text,
  }) : super(key: key);
  final int index;
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyles.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
          TextButton.icon(
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.changeNotes,
                  arguments: index);
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.textGrey,
            ),
            label: Text(
              LocaleKeys.redaktirovat.tr(),
              style: AppStyles.fontStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          DeleteNoteWidget(index: index),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return TextButton.icon(
      onPressed: () {
        model.onDeleteNote(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.textGrey,
      ),
      label: Text(
        'Удалить',
        style: AppStyles.fontStyle.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
