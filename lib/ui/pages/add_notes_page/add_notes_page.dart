import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:template/domain/providers/notes_provider.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Добавить заметку',
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: const AddNotesBody(),
    );
  }
}

class AddNotesBody extends StatelessWidget {
  const AddNotesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          TextFormFieldWidget(
            textEditingController: model.titleEditingController,
            labelText: 'Заголовок',
            hintText: 'Заголовок',
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            textEditingController: model.textEditingController,
            labelText: 'Заметки',
            hintText: 'Заметки',
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: 'notes-add-btn',
              elevation: 2,
              backgroundColor: AppColors.backGroundColor,
              onPressed: () {
                model.onAddNote();
                model.controllerClear();
                Navigator.pop(context);
              },
              label: Text(
                'Добавить',
                style: AppStyles.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.textGrey,
      decoration: InputDecoration(
    
        labelText: labelText,
        labelStyle: AppStyles.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textGrey,
        ),
        hintText: hintText,
        hintStyle: AppStyles.fontStyle.copyWith(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
