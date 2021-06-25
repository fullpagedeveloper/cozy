import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_iitem.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    ///[MAP, CONTACT]
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        //throw()
        throw Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    ///ALERT DIALOG KONFIRMASI TELP
    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Apakah kamu ingin menghubungi pemeilik kos?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchUrl('tel:${widget.space.phone}');
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      ///[TITLE]
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'month',
                                          style: grayTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ///[MAIN FACILITIES]
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Main Facility',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kithen',
                              imgUrl: 'assets/icon_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imgUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imgUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ///[PHOTO]
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Photos",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos.map(
                            (itemPhoto) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(itemPhoto,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                          ).toList(),

                          // [
                          //   SizedBox(
                          //     width: edge,
                          //   ),
                          //   Image.asset(
                          //     'assets/photo1.png',
                          //     width: 110,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   SizedBox(
                          //     width: edge,
                          //   ),
                          //   Image.asset(
                          //     'assets/photo2.png',
                          //     width: 110,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   SizedBox(
                          //     width: edge,
                          //   ),
                          //   Image.asset(
                          //     'assets/photo3.png',
                          //     width: 110,
                          //     height: 88,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   SizedBox(
                          //     width: edge,
                          //   ),
                          // ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ///[LOCATION]
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          "Location",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.space.address}\n${widget.space.city}",
                              style: grayTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(widget.space.mapUrl);
                                // launchUrl(
                                //     "https://www.google.com/maps/dir//Kontraka+bpk.sedul,+Jl.+Parung+Karet+No.8,+RT.001%2FRW.003,+Parung+Jaya,+Kec.+Karang+Tengah,+Kota+Tangerang,+Banten+15159/@-6.2008959,106.7092319,19z/data=!4m8!4m7!1m0!1m5!1m1!1s0x2e69f993afb27469:0xac473dfc612079f9!2m2!1d106.7089592!2d-6.2010847");
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: RaisedButton(
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              17,
                            ),
                          ),
                          onPressed: () {
                            showConfirmation();
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ///[Tombol back harus dibawah listview, kalo di atas di akan ketutup oleh listview]
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/btn_wishlist_active.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
