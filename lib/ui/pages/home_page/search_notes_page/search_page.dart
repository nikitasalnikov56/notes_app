import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/domain/hive/hive_box.dart';
import 'package:template/domain/hive/notes_data.dart';
import 'package:template/ui/app_navigator/app_routes.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';
import 'package:template/ui/widgets/card_widget.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  var filteredNotes = <NotesData>[];
  final searchController = TextEditingController();

  void _searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where(
        (NotesData notesList) {
          return notesList.title.toLowerCase().contains(query.toLowerCase()) ||
              notesList.text.toLowerCase().contains(query.toLowerCase());
        },
      ).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  Future<void> deleteText() async {
    searchController.clear();
  }

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.blackColor,
          style: AppStyles.fontStyle,
          decoration: const InputDecoration(
            hintText: 'Поиск...',
            hintStyle: AppStyles.fontStyle,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: deleteText,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            separatorBuilder: (_, __) => const SizedBox(
              height: 16,
            ),
            itemCount: filteredNotes.length,
            itemBuilder: (context, index) {
              final note = filteredNotes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.changeNotes,
                    (routes) => true,
                  );
                },
                child: CardWidget(
                  title: note.title,
                  date: note.date,
                  text: note.text,
                  index: index,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
