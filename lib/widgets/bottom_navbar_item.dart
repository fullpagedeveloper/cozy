import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final String imgUrl;
  final bool isActive;

  BottomNavBarItem({this.imgUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
