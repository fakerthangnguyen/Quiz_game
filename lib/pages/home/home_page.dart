


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_game/apps/routers/router_name.dart';

import 'package:quiz_game/apps/untils/const.dart';
import 'package:quiz_game/pages/home/widgets/home_dropdown.dart';
import 'package:quiz_game/pages/home/widgets/home_title.dart';
import 'package:quiz_game/widgets/button_custom.dart';

import '../../widgets/background_custom.dart';
import '../article/widgets/article_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
            Positioned.fill(
             child: Padding(
               padding:  EdgeInsets.symmetric(horizontal: getHeight(context)*0.1),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTitle(),
                  const HomeDropdown(),

                  SizedBox(height: paddingCustom(context)),
                  ButtonCustom(title: 'Bắt đầu luyện tập', onTap: (){
                    context.goNamed(RoutersName.categoryName);
                  },),
                ],
          ),
             ),
           )
        ],
      ),
    );
  }
}