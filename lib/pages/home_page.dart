import 'package:cozy/models/city.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/providers/space_provider.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottom_navbar_item.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Memanggil object SpaceProvider dari remote
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
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

              /// TARO DATA
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpace(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  /// Check kondisi
                  /// jika snapshot nya memiliki data
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;
                    int index = 0;

                    /// Maka tampilkan column card
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  /// Jika tidak ada datanya
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidline',
                      imgUrl: 'assets/tips1.png',
                      updatedAt: '20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Jakarta Firship',
                      imgUrl: 'assets/tips2.png',
                      updatedAt: '22 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imgUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
