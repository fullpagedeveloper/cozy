import 'package:cozy/models/city.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge),
          child: ListView(
            children: [
              // NOTE: TITLE/HEADER
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: grayTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  "Popular Citys",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                      id: 1,
                      name: "Jakarta",
                      imgUrl: 'assets/city1.png',
                      isPopular: true,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 2,
                      name: "Bandung",
                      imgUrl: 'assets/city2.png',
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 3,
                      name: "Tangerang",
                      imgUrl: 'assets/city3.png',
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 4,
                      name: "Surabaya",
                      imgUrl: 'assets/city4.png',
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 5,
                      name: "Bali",
                      imgUrl: 'assets/city5.png',
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 6,
                      name: "Banten",
                      imgUrl: 'assets/city6.png',
                    )),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: RECOMMENDED SPACE
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  "Recommended Space",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  children: [
                    SpaceCard(Space(
                      id: 1,
                      name: "Kuretakeso Hott",
                      imageUrl: 'assets/space1.png',
                      city: 'Jakarta',
                      country: 'Indonesia',
                      rating: 4,
                      price: 12,
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    SpaceCard(Space(
                      id: 2,
                      name: "Kuretakeso Hott",
                      imageUrl: 'assets/space2.png',
                      city: 'Bandung',
                      country: 'Indonesia',
                      rating: 4,
                      price: 12,
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    SpaceCard(Space(
                      id: 3,
                      name: "Kuretakeso Hott",
                      imageUrl: 'assets/space3.png',
                      city: 'Tangerang',
                      country: 'Indonesia',
                      rating: 4,
                      price: 12,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: TIPS & GUIDANCE
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    TipsCard(),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
