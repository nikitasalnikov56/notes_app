import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/domain/providers/notes_provider.dart';
import 'package:template/ui/app_navigator/app_routes.dart';
import 'package:template/ui/pages/add_notes_page/add_notes_page.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';

class ChangeNotesPages extends StatelessWidget {
  const ChangeNotesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, AppRoutes.home,);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
            )),
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;
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
              elevation: 2,
              backgroundColor: AppColors.backGroundColor,
              onPressed: () {
                model.onChangeNote(context, index);
              },
              label: Text(
                'Изменить',
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
