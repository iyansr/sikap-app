import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikap/models/card_data.dart';
import 'package:sikap/models/chart_models.dart';
import 'package:sikap/widget/Card.dart';
import 'package:sikap/widget/Chart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardData cardData = CardData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'PELABUHAN PERIKANAN SAMUDERA KENDARI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    child: Divider(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    // width: 200,
                    child: Swiper(
                      autoplay: true,
                      autoplayDelay: 6000,
                      itemCount: cardData.dataKapal.length,
                      itemBuilder: (BuildContext context, int id) {
                        String idCard = cardData.dataKapal[id]['id'];
                        Color bgcolors;
                        Color icColors;
                        IconData icon;

                        switch (idCard) {
                          case 'k1':
                            bgcolors = Color(0xFFF39C12);
                            icColors = Color(0xFFC27D0E);
                            icon = FontAwesomeIcons.ship;
                            break;
                          case 'k2':
                            bgcolors = Color(0xFF00A65A);
                            icColors = Color(0xFF008548);
                            icon = FontAwesomeIcons.compressArrowsAlt;

                            break;
                          case 'k3':
                            bgcolors = Color(0xFF3C8DBC);
                            icColors = Color(0xFF307196);
                            icon = FontAwesomeIcons.expandArrowsAlt;

                            break;
                          case 'k4':
                            bgcolors = Color(0xFFD81B60);
                            icColors = Color(0xFFAD164D);
                            icon = FontAwesomeIcons.anchor;

                            break;
                          case 'k5':
                            bgcolors = Color(0xFFFF851B);
                            icColors = Color(0xFFCC6A16);
                            icon = FontAwesomeIcons.ship;

                            break;
                          default:
                            bgcolors = Colors.white;
                        }

                        return CardWidget(
                          icon: icon,
                          icColor: icColors,
                          color: bgcolors,
                          title: cardData.dataKapal[id]['title'],
                          subtitle: cardData.dataKapal[id]['total'].toString(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    // width: 200,
                    child: Swiper(
                      autoplay: true,
                      autoplayDelay: 6000,
                      itemCount: cardData.dataProduksi.length,
                      itemBuilder: (BuildContext context, int id) {
                        String idCard = cardData.dataProduksi[id]['id'];
                        Color bgcolors;
                        Color icColors;
                        IconData icon;

                        switch (idCard) {
                          case 'p1':
                            bgcolors = Color(0xFF0073B7);
                            icColors = Color(0xFF005C92);
                            icon = FontAwesomeIcons.fish;
                            break;
                          case 'p2':
                            bgcolors = Color(0xFF3D9970);
                            icColors = Color(0xFF317A5A);
                            icon = FontAwesomeIcons.rss;
                            break;
                          case 'p3':
                            bgcolors = Color(0xFF001F3F);
                            icColors = Color(0xFF001932);
                            icon = FontAwesomeIcons.moneyBillAlt;
                            break;
                          case 'p4':
                            bgcolors = Color(0xFF605CA8);
                            icColors = Color(0xFF4D4A86);
                            icon = FontAwesomeIcons.users;
                            break;
                          default:
                            bgcolors = Colors.white;
                        }
                        return CardWidget(
                          color: bgcolors,
                          icColor: icColors,
                          icon: icon,
                          title: cardData.dataProduksi[id]['title'],
                          subtitle:
                              cardData.dataProduksi[id]['total'].toString(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    // width: 200,
                    child: Swiper(
                      autoplay: true,
                      autoplayDelay: 6000,
                      itemCount: cardData.dataPenyaluran.length,
                      itemBuilder: (BuildContext context, int id) {
                        String idCard = cardData.dataPenyaluran[id]['id'];
                        Color bgcolors;
                        Color icColors;
                        IconData icon;

                        switch (idCard) {
                          case 'pe1':
                            bgcolors = Color(0xFFDD4B39);
                            icColors = Color(0xFFB13C2E);
                            icon = FontAwesomeIcons.tint;
                            break;
                          case 'pe2':
                            bgcolors = Color(0xFFDB0EAD);
                            icColors = Color(0xFFAF0B8A);
                            icon = FontAwesomeIcons.icicles;
                            break;
                          case 'pe3':
                            bgcolors = Color(0xFF00A65A);
                            icColors = Color(0xFF008548);
                            icon = FontAwesomeIcons.gasPump;
                            break;
                            break;
                          default:
                            bgcolors = Colors.white;
                        }
                        return CardWidget(
                          color: bgcolors,
                          icColor: icColors,
                          icon: icon,
                          title: cardData.dataPenyaluran[id]['title'],
                          subtitle:
                              cardData.dataPenyaluran[id]['total'].toString(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.pink,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'GRAFIK KEDATANGAN DAN KEBERANGKATAN KAPAL TAHUN 2019',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: SimpleBarChart(ChartModel.createSampleData()),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
