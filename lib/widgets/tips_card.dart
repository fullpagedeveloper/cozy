import 'package:cozy/models/tips.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            tips.imgUrl,
            width: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Updated ${tips.updatedAt}",
                style: grayTextStyle,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: grayColor,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
