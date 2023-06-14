import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/domain/hive/hive_box.dart';
import 'package:template/domain/hive/notes_data.dart';
import 'package:template/ui/app_navigator/app_routes.dart';

class NotesProvider extends ChangeNotifier {
  //controllers
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();

//add notes
  Future<void> onAddNote() async {
    await HiveBoxes.notes.add(
      NotesData(
        title: titleEditingController.text.isNotEmpty
            ? titleEditingController.text
            : 'Заметки',
        text: textEditingController.text.isNotEmpty
            ? textEditingController.text
            : 'Описание',
      ),
    );
  }

  // установка поля ввода значений
  void setControllers(int index) async {
    titleEditingController.text =
        HiveBoxes.notes.getAt(index)?.title ?? 'Error';
    textEditingController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Error';
  }

// change notes
  Future<void> onChangeNote(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(
            title: titleEditingController.text,
            text: textEditingController.text,
          ),
        )
        .then(
          (value) => Navigator.pop(
            context,
            AppRoutes.home,
          ),
        );
  }

// clear controllers
  controllerClear() {
    titleEditingController.clear();
    textEditingController.clear();
  }

//Delete notes
  Future<void> onDeleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes
        .deleteAt(index)
        .then((value) => Navigator.pop(context));
  }

  bool isTheme = false;
  changeTheme(bool value) {
    isTheme = value;
    notifyListeners();
  }

  changelang(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(
        const Locale('uz'),
      );
    } else {
      context.setLocale(
        const Locale('ru'),
      );
    }
    notifyListeners();
  }
}
