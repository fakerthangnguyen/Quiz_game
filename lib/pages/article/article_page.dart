


import 'package:flutter/material.dart';
import 'package:quiz_game/apps/untils/const.dart';
import 'package:quiz_game/pages/article/widgets/article_box_content.dart';
import 'package:quiz_game/pages/article/widgets/article_loading.dart';
import 'package:quiz_game/pages/article/widgets/article_title.dart';
import 'package:quiz_game/widgets/background_custom.dart';

class ArticlePage extends StatelessWidget {
  int idTopic;
  String name;
  ArticlePage({super.key, required this.idTopic, required this.name});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingCustom(context)),
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      ArticleTitle(name: name),
                      SizedBox(height: getHeight(context)*0.04),
                      const ArticleLoading(),
                      SizedBox(height: getHeight(context)*0.04),
                      ArticleBoxContent(
                        idTopic: idTopic,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}