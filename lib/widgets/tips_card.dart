import 'package:cozy/models/space.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'assets/tips1.png',
            width: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'City Guidlines',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Update 20 Apr',
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
