import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/apps/untils/const.dart';

import '../../../providers/question_provider.dart';


class ArticleLoading extends StatelessWidget {
  const ArticleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
        builder: (context, value, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: getWidth(context),
          height: getHeight(context)*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20,),
            border: Border.all(color: Colors.white,width: 2)
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: getWidth(context)*
                 value.currentData/value.listData.length,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff44A3AE),
                      Color(0xff33FBC9),
                    ]
                  )
                ),
              ),
              const Positioned.fill(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Loading...',style: TextStyle(color: Colors.white),),
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: getHeight(context)*0.04),
        RichText(
            text:  TextSpan(
              children: [
                const TextSpan(text: 'Question '),
                TextSpan(text: value.currentData.toString()),
                const TextSpan(text: '/'),
                TextSpan(text: value.listData.length.toString()),
              ]
            )
        )
      ],
    )
    );
  }
}