import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:marquee/marquee.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get _stream => _controller.stream;

  var _bottomNavIndex = 0; //default index of a first screen

  final iconList = <IconData>[
    Icons.home,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 25),
          child: SwipeRefresh.adaptive(
            stateStream: _stream,
            onRefresh: () async {
              // When all needed is done change state.
              _controller.sink.add(SwipeRefreshState.hidden);
            },
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //name and dp
                  const Padding(
                    padding: EdgeInsets.only(left: 17.0, right: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //name here
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              "Hi, Jayflo_Tech",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/dp.png"),
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  //card swipe
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: Swiper.children(
                      autoplay: false,
                      layout: SwiperLayout.TINDER,
                      itemWidth: MediaQuery.of(context).size.width,
                      itemHeight: 240,
                      pagination: const SwiperPagination(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                          builder: DotSwiperPaginationBuilder(
                              color: Color.fromARGB(219, 246, 241, 241),
                              activeColor: Colors.white,
                              size: 3.0,
                              activeSize: 5.0)),
                      children: <Widget>[
                        Image.asset(
                          'assets/visa.png',
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          'assets/mastercard.png',
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          'assets/verve.png',
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  //function icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      funIcon(
                          const Color.fromARGB(255, 205, 245, 193),
                          const Color.fromARGB(255, 32, 63, 24),
                          Icons.send_rounded,
                          'Transfer'),
                      funIcon(
                          const Color.fromARGB(255, 248, 238, 172),
                          const Color.fromARGB(255, 105, 73, 16),
                          Icons.call_made,
                          'Send'),
                      funIcon(
                          const Color.fromARGB(255, 248, 172, 247),
                          const Color.fromARGB(255, 63, 24, 49),
                          Icons.group,
                          'More'),
                      funIcon(
                          const Color.fromARGB(255, 172, 196, 248),
                          const Color.fromARGB(255, 24, 29, 63),
                          Icons.history,
                          'History'),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 35)),

                  //transaction history
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Send Money',
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 46, 46),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              color: Color.fromARGB(255, 73, 71, 71),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),

                  //transaction list
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        transactionList(
                            Color.fromARGB(95, 248, 238, 172),
                            'https://cdn.hashnode.com/res/hashnode/image/upload/v1631686428996/Ysx5JZys3.png',
                            'John Smith',
                            '50.00'),
                        transactionList(
                            Color.fromARGB(85, 205, 245, 193),
                            'https://avatars.githubusercontent.com/u/69567027?v=4',
                            'Jane Smith',
                            '783.00'),
                        transactionList(
                            Color.fromARGB(88, 172, 224, 248),
                            'https://cdn.hashnode.com/res/hashnode/image/upload/v1631686428996/Ysx5JZys3.png',
                            'John Doe',
                            '350.00'),
                        transactionList(
                            Color.fromARGB(83, 248, 172, 173),
                            'https://avatars.githubusercontent.com/u/69567027?v=4',
                            'Jane Doe',
                            '47.00'),
                        transactionList(
                            Color.fromARGB(78, 248, 238, 172),
                            'https://cdn.hashnode.com/res/hashnode/image/upload/v1631686428996/Ysx5JZys3.png',
                            'Dr Who',
                            '50.00'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Marquee(
                      text: 'Follow Jayflo_Tech on all social media for more',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 100.0,
                      velocity: 20.0,
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 1000),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 205, 245, 193),
        onPressed: () {},
        child: Icon(
          Icons.dashboard,
          color: Colors.black,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 249, 246, 246),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget funIcon(color1, color2, icon, text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color1,
          ),
          child: Icon(
            icon,
            color: color2,
          ),
        ),
        Text(text)
      ],
    );
  }

  Widget transactionList(color1, dp, name, amount) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color1,
            ),
            child: Column(
              children: [
                //dp
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color1,
                  ),
                  child: Image.network(
                    dp,
                    width: 70,
                    height: 70,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 51, 49, 49),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_interpolation_to_compose_strings
                Text(
                  '\$' "$amount",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )
              ],
            )),
      ],
    );
  }
}
