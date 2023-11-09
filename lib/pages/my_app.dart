
import 'package:flutter/material.dart';
import 'package:quiz_game/apps/routers/router.dart';
import 'package:quiz_game/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/providers/question_provider.dart';

class MyApp extends StatelessWidget {
  final int idTopic;
  const MyApp({super.key, this.idTopic = 0});



  @override
  Widget build(BuildContext context){

    return MultiProvider(
      providers : [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..getListLanguage(),
          
        ),
        ChangeNotifierProvider(
          create: (_) => QuestionProvider()..getQuestionList(idTopic),

        ),
      ],

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterCustom.router,
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
        ),

      ),
    );
  }
}