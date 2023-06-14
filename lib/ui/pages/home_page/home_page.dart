import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/domain/providers/notes_provider.dart';
import 'package:template/generated/locale_keys.g.dart';
import 'package:template/ui/app_navigator/app_routes.dart';
import 'package:template/ui/theme/app_colors.dart';
import 'package:template/ui/theme/app_styles.dart';
import 'package:template/ui/widgets/notes_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return Scaffold(
      drawer: const Drawer(
        width: 80,
        backgroundColor: AppColors.backGroundColor,
        child: DrawerItems(),
      ),
      appBar: AppBar(
        leading: const OpenDrawer(),
        backgroundColor: AppColors.backGroundColor,
        title: Text(
          LocaleKeys.zametki.tr(),
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: AppColors.blackColor,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
        ],
      ),
      body: const NotesBody(),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: AppColors.backGroundColor,
          onPressed: () {
            model.controllerClear();
            Navigator.pushNamed(
              context,
              AppRoutes.addNotes,
            );
          },
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
    );
  }
}

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu_rounded,
        color: AppColors.blackColor,
      ),
    );
    
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return SafeArea(
      child: Column(
        children: [
          Switch(
              activeColor: AppColors.purpleColor,
              activeTrackColor: AppColors.lightGrey,
              value: model.isTheme,
              onChanged: (value) {
                model.changeTheme(value);
              }),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {
              model.changelang(context);
            },
            icon: const Icon(
              Icons.language,
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
