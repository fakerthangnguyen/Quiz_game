
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/providers/category_provider.dart';

import '../../../models/category_model.dart';

class HomeDropdown extends StatelessWidget {
  const HomeDropdown({super.key});
  @override
  Widget build(BuildContext context){
    List<Category> listLanguage =
        context.watch<CategoryProvider>().listLanguage;
    return   DropdownButton(
      value:  context.watch<CategoryProvider>().idLanguageChoose,
      hint: const Text('Chọn ngôn ngữ của bạn', style: TextStyle(color: Colors.white54),),
      isExpanded: true,
      items: listLanguage.map((Category value) {
        return DropdownMenuItem(
          value: value.id,
          child: Text(value.name),
        );
      }).toList(),
      onChanged: (value) {
        context.read<CategoryProvider>().setIdLanguageChoose(value as int);
      },

    );
  }
}