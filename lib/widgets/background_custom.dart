import 'package:flutter/material.dart';


class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({super.key});
  @override
  Widget build(BuildContext context){
    return Positioned.fill(
        child: Image.asset('assets/images/Hinh-nen-mat-trang-mobile-1.jpg',
          fit: BoxFit.cover,
        )
    );
  }
}