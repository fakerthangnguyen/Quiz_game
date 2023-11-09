import 'package:flutter/material.dart';
import 'package:quiz_game/apps/untils/const.dart';


class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Let\'s play quiz game',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: getHeight(context) * 0.02),
        const Text('Bộ câu hỏi lập trình tại GB'),
        SizedBox(height: getHeight(context) * 0.06),
      ],
    );
  }
}