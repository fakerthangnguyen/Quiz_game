import 'package:flutter/material.dart';

import '../apps/untils/const.dart';

class ButtonCustom extends StatelessWidget {
  String title;
  Function onTap;
  ButtonCustom({super.key, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context){
    return  Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        splashColor: Colors.green,
        onTap: () => onTap(),
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: getHeight(context)*0.02),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff44A3AE),Color(0xff33FBC9),]
              )
          ),
          width: getWidth(context),
          child:  Align(
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}