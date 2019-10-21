import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sikap/models/chart_models.dart';
import 'package:sikap/utils/dashboard_provider.dart';
import 'package:sikap/widget/Chart.dart';
import 'package:sikap/widget/Swiper.dart';
import 'package:sikap/widget/card_loading.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pr = Provider.of<DashBoardProvider>(context);

    Widget sw() {
      return Container(
        child: Column(
          children: <Widget>[
            // getDataBagianKapal(context, sub: )
            getDataBagianKapal(context),
            SizedBox(
              height: 10,
            ),
            getDashBoard1(context),
            SizedBox(
              height: 10,
            ),
            getDashBoard2(context),
          ],
        ),
      );
    }

    Widget loading() {
      return Container(
        child: Column(
          children: <Widget>[
            // getDataBagianKapal(context, sub: )
            LoadingCard(),
            SizedBox(
              height: 10,
            ),
            LoadingCard(),
            SizedBox(
              height: 10,
            ),
            LoadingCard(),
          ],
        ),
      );
    }

    // var init = SizedBox(
    //   child: CircularProgressIndicator(),
    //   height: 100,
    //   width: 100,
    // );

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

            // /===========================

            FutureBuilder(
              future: _pr.getDashboardData(),
              builder: (_, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  return sw();
                }
                return loading();
              },
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
